From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 23:12:54 +0100
Subject: [Buildroot] [git commit] python-pam: new package
Message-ID: <20141207221302.93808800BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=848ef692ae40021c148daee3ffc619658fdfe668
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream is no longer available, so get the tarball + important patches from
Fedora.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/python-pam/0001-dealloc.patch              |   25 ++++
 package/python-pam/0002-nofree.patch               |   68 ++++++++++
 .../0003-memory-errors-CVE2012-1502.patch          |  136 ++++++++++++++++++++
 package/python-pam/Config.in                       |   15 ++
 package/python-pam/python-pam.mk                   |   16 +++
 6 files changed, 261 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f06a486..600a68d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -515,6 +515,7 @@ menu "external python modules"
 	source "package/python-networkmanager/Config.in"
 	source "package/python-nfc/Config.in"
 	source "package/python-numpy/Config.in"
+	source "package/python-pam/Config.in"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
diff --git a/package/python-pam/0001-dealloc.patch b/package/python-pam/0001-dealloc.patch
new file mode 100644
index 0000000..dd4f961
--- /dev/null
+++ b/package/python-pam/0001-dealloc.patch
@@ -0,0 +1,25 @@
+[PATCH] fix two bugs in the PAM object deallocation
+
+Fixes https://bugzilla.redhat.com/show_bug.cgi?id=658955
+
+Downloaded from:
+http://pkgs.fedoraproject.org/cgit/PyPAM.git/plain/PyPAM-0.5.0-dealloc.patch
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+diff -up PyPAM-0.5.0/PAMmodule.c.dealloc PyPAM-0.5.0/PAMmodule.c
+--- PyPAM-0.5.0/PAMmodule.c.dealloc	2011-01-17 22:48:22.000000000 +0100
++++ PyPAM-0.5.0/PAMmodule.c	2011-01-18 21:24:59.000000000 +0100
+@@ -538,10 +538,11 @@ static void PyPAM_dealloc(PyPAMObject *s
+     free(self->service);
+     free(self->user);
+     free(self->conv);
+-    pam_end(self->pamh, PAM_SUCCESS);
++    if (self->pamh)
++        pam_end(self->pamh, PAM_SUCCESS);
+     dlclose(self->dlh2);
+     dlclose(self->dlh1);
+-    PyMem_DEL(self);
++    PyObject_Del(self);
+ }
+ 
+ static PyObject * PyPAM_getattr(PyPAMObject *self, char *name)
diff --git a/package/python-pam/0002-nofree.patch b/package/python-pam/0002-nofree.patch
new file mode 100644
index 0000000..7de8801
--- /dev/null
+++ b/package/python-pam/0002-nofree.patch
@@ -0,0 +1,68 @@
+[PATCH] deallocate the conversation response only in case of error
+
+Fixes https://bugzilla.redhat.com/show_bug.cgi?id=679714
+
+Downloaded from:
+http://pkgs.fedoraproject.org/cgit/PyPAM.git/plain/PyPAM-0.5.0-nofree.patch
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+diff --git a/PAMmodule.c b/PAMmodule.c
+index 03cb799..a7ff8a5 100644
+--- a/PAMmodule.c
++++ b/PAMmodule.c
+@@ -24,8 +24,6 @@ typedef struct {
+     char                *service;
+     char                *user;
+     PyObject            *callback;
+-    struct pam_response *response_data;
+-    int                 response_len;
+     PyObject            *user_data;
+     void                *dlh1, *dlh2;
+ } PyPAMObject;
+@@ -54,15 +52,6 @@ static int PyPAM_conv(int num_msg, const struct pam_message **msg,
+ 
+     Py_INCREF(self);
+ 
+-    if (NULL != self->response_data) {
+-        for (int i = 0; i < self->response_len; i++) {
+-            free(self->response_data[0].resp);
+-        }
+-        free(self->response_data);
+-        self->response_data = NULL;
+-        self->response_len = 0;
+-    }
+-
+     PyObject* msgList = PyList_New(num_msg);
+     
+     for (int i = 0; i < num_msg; i++) {
+@@ -92,6 +81,10 @@ static int PyPAM_conv(int num_msg, const struct pam_message **msg,
+         char* resp_text;
+         int resp_retcode = 0;
+         if (!PyArg_ParseTuple(respTuple, "si", &resp_text, &resp_retcode)) {
++            while (i > 0) {
++                free((--spr)->resp);
++                --i;
++            }
+             free(*resp);
+             Py_DECREF(respList);
+             return PAM_CONV_ERR;
+@@ -100,10 +93,6 @@ static int PyPAM_conv(int num_msg, const struct pam_message **msg,
+         spr->resp_retcode = resp_retcode;
+         Py_DECREF(respTuple);
+     }
+-    
+-    // Save this so we can free it later.
+-    self->response_data = *resp;
+-    self->response_len = PyList_Size(respList);
+ 
+     Py_DECREF(respList);
+     
+@@ -144,8 +133,6 @@ static PyObject * PyPAM_pam(PyObject *self, PyObject *args)
+     p->user = NULL;
+     Py_INCREF(Py_None);
+     p->callback = Py_None;
+-    p->response_data = NULL;
+-    p->response_len = 0;
+     Py_INCREF(Py_None);
+     p->user_data = Py_None;
+     
diff --git a/package/python-pam/0003-memory-errors-CVE2012-1502.patch b/package/python-pam/0003-memory-errors-CVE2012-1502.patch
new file mode 100644
index 0000000..62405db
--- /dev/null
+++ b/package/python-pam/0003-memory-errors-CVE2012-1502.patch
@@ -0,0 +1,136 @@
+[PATCH] Fix Double Free Corruption (CVE2012-1502)
+
+Downloaded from:
+http://pkgs.fedoraproject.org/cgit/PyPAM.git/plain/PyPAM-0.5.0-memory-errors.patch
+
+For details, see: https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2012-1502
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+diff -up PyPAM-0.5.0/PAMmodule.c.memory PyPAM-0.5.0/PAMmodule.c
+--- PyPAM-0.5.0/PAMmodule.c.memory	2012-05-07 17:22:54.503914026 +0200
++++ PyPAM-0.5.0/PAMmodule.c	2012-05-07 17:23:15.644381942 +0200
+@@ -37,33 +37,48 @@ static void PyPAM_Err(PyPAMObject *self,
+ 
+     err_msg = pam_strerror(self->pamh, result);
+     error = Py_BuildValue("(si)", err_msg, result);
+-    Py_INCREF(PyPAM_Error);
+     PyErr_SetObject(PyPAM_Error, error);
++    Py_XDECREF(error);
+ }
+ 
+ static int PyPAM_conv(int num_msg, const struct pam_message **msg,
+     struct pam_response **resp, void *appdata_ptr)
+ {
+-    PyObject                *args;
+-
++    PyObject *args, *msgList, *respList, *item;
++    struct pam_response *response, *spr;
+     PyPAMObject* self = (PyPAMObject *) appdata_ptr;
++
+     if (self->callback == NULL)
+         return PAM_CONV_ERR;
+ 
+     Py_INCREF(self);
+ 
+-    PyObject* msgList = PyList_New(num_msg);
+-    
++    msgList = PyList_New(num_msg);
++    if (msgList == NULL) {
++        Py_DECREF(self);
++        return PAM_CONV_ERR;
++    }
++
+     for (int i = 0; i < num_msg; i++) {
+-        PyList_SetItem(msgList, i,
+-            Py_BuildValue("(si)", msg[i]->msg, msg[i]->msg_style));
++        item = Py_BuildValue("(si)", msg[i]->msg, msg[i]->msg_style);
++        if (item == NULL) {
++            Py_DECREF(msgList);
++            Py_DECREF(self);
++            return PAM_CONV_ERR;
++        }
++        PyList_SetItem(msgList, i, item);
+     }
+-    
++
+     args = Py_BuildValue("(OO)", self, msgList);
+-    PyObject* respList = PyEval_CallObject(self->callback, args);
++    if (args == NULL) {
++        Py_DECREF(self);
++	Py_DECREF(msgList);
++        return PAM_CONV_ERR;
++    }
++    respList = PyEval_CallObject(self->callback, args);
+     Py_DECREF(args);
+     Py_DECREF(self);
+-    
++
+     if (respList == NULL)
+         return PAM_CONV_ERR;
+ 
+@@ -71,11 +86,15 @@ static int PyPAM_conv(int num_msg, const
+         Py_DECREF(respList);
+         return PAM_CONV_ERR;
+     }
+-    
+-    *resp = (struct pam_response *) malloc(
++
++    response = (struct pam_response *) malloc(
+         PyList_Size(respList) * sizeof(struct pam_response));
++    if (response == NULL) {
++        Py_DECREF(respList);
++        return PAM_CONV_ERR;
++    }
++    spr = response;
+ 
+-    struct pam_response* spr = *resp;
+     for (int i = 0; i < PyList_Size(respList); i++, spr++) {
+         PyObject* respTuple = PyList_GetItem(respList, i);
+         char* resp_text;
+@@ -85,7 +104,7 @@ static int PyPAM_conv(int num_msg, const
+                 free((--spr)->resp);
+                 --i;
+             }
+-            free(*resp);
++            free(response);
+             Py_DECREF(respList);
+             return PAM_CONV_ERR;
+         }
+@@ -95,7 +114,8 @@ static int PyPAM_conv(int num_msg, const
+     }
+ 
+     Py_DECREF(respList);
+-    
++    *resp = response;
++
+     return PAM_SUCCESS;
+ }
+ 
+@@ -122,7 +142,11 @@ static PyObject * PyPAM_pam(PyObject *se
+     PyPAMObject_Type.ob_type = &PyType_Type;
+     p = (PyPAMObject *) PyObject_NEW(PyPAMObject, &PyPAMObject_Type);
+ 
++    if (p == NULL)
++        return NULL;
++
+     if ((spc = (struct pam_conv *) malloc(sizeof(struct pam_conv))) == NULL) {
++        Py_DECREF((PyObject *)p);
+         PyErr_SetString(PyExc_MemoryError, "out of memory");
+         return NULL;
+     }
+@@ -455,9 +479,15 @@ static PyObject * PyPAM_getenvlist(PyObj
+     }
+     
+     retval = PyList_New(0);
++    if (retval == NULL)
++	return NULL;
+     
+     while ((cp = *(result++)) != NULL) {
+         entry = Py_BuildValue("s", cp);
++        if (entry == NULL) {
++            Py_DECREF(retval);
++            return NULL;
++        }
+         PyList_Append(retval, entry);
+         Py_DECREF(entry);
+     }
diff --git a/package/python-pam/Config.in b/package/python-pam/Config.in
new file mode 100644
index 0000000..b2ab6c8
--- /dev/null
+++ b/package/python-pam/Config.in
@@ -0,0 +1,15 @@
+comment "python-pam needs a toolchain w/ wchar, locale, dynamic library"
+	depends on BR2_PACKAGE_PYTHON
+	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
+
+config BR2_PACKAGE_PYTHON_PAM
+	bool "python-pam"
+	depends on BR2_PACKAGE_PYTHON # C extension not compatible with python3
+	depends on BR2_ENABLE_LOCALE # linux-pam
+	depends on BR2_USE_WCHAR # linux-pam
+	depends on !BR2_PREFER_STATIC_LIB # linux-pam
+	select BR2_PACKAGE_LINUX_PAM
+	help
+	  PAM (Pluggable Authentication Module) bindings for Python.
+
+	  https://admin.fedoraproject.org/pkgdb/package/PyPAM/
diff --git a/package/python-pam/python-pam.mk b/package/python-pam/python-pam.mk
new file mode 100644
index 0000000..1e8a593
--- /dev/null
+++ b/package/python-pam/python-pam.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-pam
+#
+################################################################################
+
+PYTHON_PAM_VERSION = 0.5.0
+PYTHON_PAM_SOURCE = PyPAM-$(PYTHON_PAM_VERSION).tar.gz
+# pangalactic.org gone
+PYTHON_PAM_SITE = http://pkgs.fedoraproject.org/repo/pkgs/PyPAM/PyPAM-0.5.0.tar.gz/f1e7c2c56421dda28a75ace59a3c8871/
+PYTHON_PAM_SETUP_TYPE = distutils
+PYTHON_PAM_LICENSE = LGPLv2.1
+PYTHON_PAM_LICENSE_FILES = COPYING
+PYTHON_PAM_DEPENDENCIES = linux-pam
+
+$(eval $(python-package))
