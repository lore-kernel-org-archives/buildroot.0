From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 12 Mar 2018 11:34:15 +0100
Subject: [Buildroot] [PATCH v3 2/2] python-psycopg2: new package
In-Reply-To: <20180312101231.2280-2-aduskett@gmail.com>
References: <20180312101231.2280-1-aduskett@gmail.com>
 <20180312101231.2280-2-aduskett@gmail.com>
Message-ID: <CAGm1_ksayD-5RFa6RVadxrr6VTZHZ7SvHta4SgN3WkpqPeq+dg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 12, 2018 at 11:12 AM, Adam Duskett <aduskett@gmail.com> wrote:
> Psycopg is the most popular PostgreSQL database adapter for the Python
> programming language. Its main features are the complete implementation of the
> Python DB API 2.0 specification and the thread safety (several threads can
> share the same connection). It was designed for heavily multi-threaded
> applications that create and destroy lots of cursors and make a large number of
> concurrent INSERTs or UPDATEs.
>
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - None
>
> Changes v2 -> v3:
>   - Removed python-psycopg2/0001-don-t-use-pg_config.patch
>   - Added PYTHON_PSYCOPG2_BUILD_OPTS and PYTHON_PSYCOPG2_INSTALL_TARGET_OPTS
>     to point towards Buildroots own pg_config file. (Thomas)
>   - Updated to 2.7.4
>
>  DEVELOPERS                                   |  1 +
>  package/Config.in                            |  1 +
>  package/python-psycopg2/Config.in            | 22 ++++++++++++++++++++++
>  package/python-psycopg2/python-psycopg2.hash |  4 ++++
>  package/python-psycopg2/python-psycopg2.mk   | 21 +++++++++++++++++++++
>  5 files changed, 49 insertions(+)
>  create mode 100644 package/python-psycopg2/Config.in
>  create mode 100644 package/python-psycopg2/python-psycopg2.hash
>  create mode 100644 package/python-psycopg2/python-psycopg2.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3df820e712..6329bcde2d 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -53,6 +53,7 @@ F:    package/nginx-naxsi/
>  F:     package/policycoreutils/
>  F:     package/python-flask-sqlalchemy/
>  F:     package/python-mutagen/
> +F:     package/python-psycopg2/
>  F:     package/python-sqlalchemy/
>  F:     package/restorecond/
>  F:     package/refpolicy/
> diff --git a/package/Config.in b/package/Config.in
> index 449ffcc47b..d40170ccf9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -856,6 +856,7 @@ menu "External python modules"
>         source "package/python-prompt-toolkit/Config.in"
>         source "package/python-protobuf/Config.in"
>         source "package/python-psutil/Config.in"
> +       source "package/python-psycopg2/Config.in"
>         source "package/python-ptyprocess/Config.in"
>         source "package/python-pudb/Config.in"
>         source "package/python-pyasn/Config.in"
> diff --git a/package/python-psycopg2/Config.in b/package/python-psycopg2/Config.in
> new file mode 100644
> index 0000000000..ec852bb49e
> --- /dev/null
> +++ b/package/python-psycopg2/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_PYTHON_PSYCOPG2
> +       bool "python-psycopg2"
> +       select BR2_PACKAGE_POSTGRESQL
> +       help
> +         Psycopg is the most popular PostgreSQL database adapter for
> +         the Python programming language. Its main features are the
> +         complete implementation of the Python DB API 2.0 specification
> +         and the thread safety (several threads can share the same
> +         connection). It was designed for heavily multi-threaded
> +         applications that create and destroy lots of cursors and make
> +         a large number of concurrent INSERTs or UPDATEs.
> +
> +         Psycopg 2 is mostly implemented in C as a libpq wrapper,
> +         resulting in being both efficient and secure. It features
> +         client-side and server-side cursors, asynchronous
> +         communication and notifications, COPY support. Many Python
> +         types are supported out-of-the-box and adapted to matching
> +         PostgreSQL data types; adaptation can be extended and
> +         customized thanks to a flexible objects adaptation system.
> +         Psycopg 2 is both Unicode and Python 3 friendly.
> +
> +         http://initd.org/psycopg/

Postgresql deps are missing:

comment "postgresql needs a toolchain w/ dynamic library"
        depends on BR2_STATIC_LIBS

With these changes applied you can add my

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Yegor

> diff --git a/package/python-psycopg2/python-psycopg2.hash b/package/python-psycopg2/python-psycopg2.hash
> new file mode 100644
> index 0000000000..ea4a07697b
> --- /dev/null
> +++ b/package/python-psycopg2/python-psycopg2.hash
> @@ -0,0 +1,4 @@
> +# md5 from https://pypi.python.org/pypi/psycopg2/json, sha256 locally computed
> +md5    70fc57072e084565a42689d416cf2c5c  psycopg2-2.7.4.tar.gz
> +sha256 8bf51191d60f6987482ef0cfe8511bbf4877a5aa7f313d7b488b53189cf26209  psycopg2-2.7.4.tar.gz
> +sha256 1752db3c786e12b62ca804178dca033adce8bff4c4b3d98d3449d407fe45210d  LICENSE
> diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
> new file mode 100644
> index 0000000000..3cb8c85778
> --- /dev/null
> +++ b/package/python-psycopg2/python-psycopg2.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# python-psycopg2
> +#
> +################################################################################
> +
> +PYTHON_PSYCOPG2_VERSION = 2.7.4
> +PYTHON_PSYCOPG2_SOURCE = psycopg2-$(PYTHON_PSYCOPG2_VERSION).tar.gz
> +PYTHON_PSYCOPG2_SITE = https://pypi.python.org/packages/74/83/51580322ed0e82cba7ad8e0af590b8fb2cf11bd5aaa1ed872661bd36f462
> +PYTHON_PSYCOPG2_SETUP_TYPE = setuptools
> +PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+
> +PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
> +PYTHON_PSYCOPG2_DEPENDENCIES = postgresql
> +
> +# Force psycopg2 to use the BuildRoot provided postgresql version instead of
> +# The host machines
> +PYTHON_PSYCOPG2_BUILD_OPTS += build_ext --pg-config=$(STAGING_DIR)/usr/bin/pg_config
> +
> +PYTHON_PSYCOPG2_INSTALL_TARGET_OPTS += build_ext --pg-config=$(STAGING_DIR)/usr/bin/pg_config
> +
> +$(eval $(python-package))
> --
> 2.14.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot<div class="gmail_extra"><br><div class="gmail_quote">On Mon, Mar 12, 2018 at 11:12 AM, Adam Duskett <span dir="ltr">&lt;<a href="mailto:aduskett@gmail.com" target="_blank">aduskett at gmail.com</a>&gt;</span> wrote:<br><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Psycopg is the most popular PostgreSQL database adapter for the Python<br>
programming language. Its main features are the complete
implementation of the<br>
Python DB API 2.0 specification and the thread safety (several threads can<br>
share the same connection). It was designed for heavily multi-threaded<br>
applications that create and destroy lots of cursors and make a large
number of<br>
concurrent INSERTs or UPDATEs.<br>
<br>
Signed-off-by: Adam Duskett &lt;<a
href="mailto:aduskett@gmail.com">aduskett at gmail.com</a>&gt;<br>
---<br>
Changes v1 -&gt; v2:<br>
&nbsp; - None<br>
<br>
Changes v2 -&gt; v3:<br>
&nbsp; - Removed python-psycopg2/0001-don-t-<wbr>use-pg_config.patch<br>
&nbsp; - Added PYTHON_PSYCOPG2_BUILD_OPTS and
PYTHON_PSYCOPG2_INSTALL_<wbr>TARGET_OPTS<br>
&nbsp; &nbsp; to point towards Buildroots own pg_config file. (Thomas)<br>
&nbsp; - Updated to 2.7.4<br>
<br>
&nbsp;DEVELOPERS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;|&nbsp; 1 +<br>
&nbsp;package/Config.in&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 1
+<br>
&nbsp;package/python-psycopg2/<wbr>Config.in&nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; | 22 ++++++++++++++++++++++<br>
&nbsp;package/python-psycopg2/<wbr>python-psycopg2.hash |&nbsp; 4 ++++<br>
&nbsp;package/python-psycopg2/<a href="http://python-psycopg2.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-psycopg2.mk&amp;source=gmail&amp;ust=1520936994549000&amp;usg=AFQjCNFeItpacXzQMw7mFCro5y6_2TwVNg"
rel="noreferrer" target="_blank">python<wbr>-psycopg2.mk</a>&nbsp;
&nbsp;| 21 +++++++++++++++++++++<br>
&nbsp;5 files changed, 49 insertions(+)<br>
&nbsp;create mode 100644 package/python-psycopg2/<wbr>Config.in<br>
&nbsp;create mode 100644 package/python-psycopg2/<wbr>python-psycopg2.hash<br>
&nbsp;create mode 100644 package/python-psycopg2/<a
href="http://python-psycopg2.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-psycopg2.mk&amp;source=gmail&amp;ust=1520936994550000&amp;usg=AFQjCNF6eQQgAZXDwH-sX_XlbMCbepnKvg"
rel="noreferrer" target="_blank">python<wbr>-psycopg2.mk</a><br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index 3df820e712..6329bcde2d 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -53,6 +53,7 @@ F:&nbsp; &nbsp; package/nginx-naxsi/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/policycoreutils/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-flask-<wbr>sqlalchemy/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-mutagen/<br>
+F:&nbsp; &nbsp; &nbsp;package/python-psycopg2/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-sqlalchemy/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/restorecond/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/refpolicy/<br>
diff --git a/package/Config.in b/package/Config.in<br>
index 449ffcc47b..d40170ccf9 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -856,6 +856,7 @@ menu "External python modules"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source
"package/python-prompt-<wbr>toolkit/Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-protobuf/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-psutil/Config.<wbr>in"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;source "package/python-psycopg2/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source
"package/python-ptyprocess/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-pudb/Config.<wbr>in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-pyasn/Config.<wbr>in"<br>
diff --git a/package/python-psycopg2/<wbr>Config.in
b/package/python-psycopg2/<wbr>Config.in<br>
new file mode 100644<br>
index 0000000000..ec852bb49e<br>
--- /dev/null<br>
+++ b/package/python-psycopg2/<wbr>Config.in<br>
@@ -0,0 +1,22 @@<br>
+config BR2_PACKAGE_PYTHON_PSYCOPG2<br>
+&nbsp; &nbsp; &nbsp; &nbsp;bool "python-psycopg2"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_POSTGRESQL<br>
+&nbsp; &nbsp; &nbsp; &nbsp;help<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Psycopg is the most popular
PostgreSQL database adapter for<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;the Python programming language.
Its main features are the<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;complete implementation of the
Python DB API 2.0 specification<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;and the thread safety (several
threads can share the same<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;connection). It was designed for
heavily multi-threaded<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;applications that create and
destroy lots of cursors and make<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;a large number of concurrent
INSERTs or UPDATEs.<br>
+<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Psycopg 2 is mostly implemented in
C as a libpq wrapper,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;resulting in being both efficient
and secure. It features<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;client-side and server-side
cursors, asynchronous<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;communication and notifications,
COPY support. Many Python<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;types are supported out-of-the-box
and adapted to matching<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;PostgreSQL data types; adaptation
can be extended and<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;customized thanks to a flexible
objects adaptation system.<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Psycopg 2 is both Unicode and
Python 3 friendly.<br>
+<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href="http://initd.org/psycopg/"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://initd.org/psycopg/&amp;source=gmail&amp;ust=1520936994550000&amp;usg=AFQjCNExcJs6P0RwG9xs65ktEQKMNYO-Lw"
rel="noreferrer" target="_blank">http://initd.org/psycopg/</a><br>
diff --git a/package/python-psycopg2/<wbr>python-psycopg2.hash
b/package/python-psycopg2/<wbr>python-psycopg2.hash<br>
new file mode 100644<br>
index 0000000000..ea4a07697b<br>
--- /dev/null<br>
+++ b/package/python-psycopg2/<wbr>python-psycopg2.hash<br>
@@ -0,0 +1,4 @@<br>
+# md5 from <a href="https://pypi.python.org/pypi/psycopg2/json"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/pypi/psycopg2/json&amp;source=gmail&amp;ust=1520936994551000&amp;usg=AFQjCNFBZ2ZGn1_7vjNz1EICtNJfxppeiQ"
rel="noreferrer"
target="_blank">https://pypi.python.org/pypi/<wbr>psycopg2/json</a>,
sha256 locally computed<br>
+md5&nbsp; &nbsp; 70fc57072e084565a42689d416cf2c<wbr>5c&nbsp;
psycopg2-2.7.4.tar.gz<br>
+sha256 8bf51191d60f6987482ef0cfe8511b<wbr>bf4877a5aa7f313d7b488b53189cf2<wbr>6209&nbsp;
psycopg2-2.7.4.tar.gz<br>
+sha256 1752db3c786e12b62ca804178dca03<wbr>3adce8bff4c4b3d98d3449d407fe45<wbr>210d&nbsp;
LICENSE<br>
diff --git a/package/python-psycopg2/<a
href="http://python-psycopg2.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-psycopg2.mk&amp;source=gmail&amp;ust=1520936994551000&amp;usg=AFQjCNGAOhS0vQFFkraTzmuC1DNlw846lQ"
rel="noreferrer" target="_blank">pyth<wbr>on-psycopg2.mk</a>
b/package/python-psycopg2/<a href="http://python-psycopg2.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-psycopg2.mk&amp;source=gmail&amp;ust=1520936994551000&amp;usg=AFQjCNGAOhS0vQFFkraTzmuC1DNlw846lQ"
rel="noreferrer" target="_blank">pyth<wbr>on-psycopg2.mk</a><br>
new file mode 100644<br>
index 0000000000..3cb8c85778<br>
--- /dev/null<br>
+++ b/package/python-psycopg2/<a href="http://python-psycopg2.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-psycopg2.mk&amp;source=gmail&amp;ust=1520936994551000&amp;usg=AFQjCNGAOhS0vQFFkraTzmuC1DNlw846lQ"
rel="noreferrer" target="_blank">pyth<wbr>on-psycopg2.mk</a><br>
@@ -0,0 +1,21 @@<br>
+#############################<wbr>##############################<wbr>#####################<br>
+#<br>
+# python-psycopg2<br>
+#<br>
+#############################<wbr>##############################<wbr>#####################<br>
+<br>
+PYTHON_PSYCOPG2_VERSION = 2.7.4<br>
+PYTHON_PSYCOPG2_SOURCE = psycopg2-$(PYTHON_PSYCOPG2_<wbr>VERSION).tar.gz<br>
+PYTHON_PSYCOPG2_SITE = <a
href="https://pypi.python.org/packages/74/83/51580322ed0e82cba7ad8e0af590b8fb2cf11bd5aaa1ed872661bd36f462&#10;+PYTHON_PSYCOPG2_SETUP_TYPE"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/packages/74/83/51580322ed0e82cba7ad8e0af590b8fb2cf11bd5aaa1ed872661bd36f462%0A%2BPYTHON_PSYCOPG2_SETUP_TYPE&amp;source=gmail&amp;ust=1520936994552000&amp;usg=AFQjCNF85R-cL8pLEMOaqL4RdeoG_-P9tw"
rel="noreferrer"
target="_blank">https://pypi.python.org/<wbr>packages/74/83/<wbr>51580322ed0e82cba7ad8e0af590b8<wbr>fb2cf11bd5aaa1ed872661bd36f462<br>
+PYTHON_PSYCOPG2_SETUP_TYPE</a> = setuptools<br>
+PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+<br>
+PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE<br>
+PYTHON_PSYCOPG2_DEPENDENCIES = postgresql<br>
+<br>
+# Force psycopg2 to use the BuildRoot provided postgresql version
instead of<br>
+# The host machines<br>
+PYTHON_PSYCOPG2_BUILD_OPTS += build_ext
--pg-config=$(STAGING_DIR)/<wbr>usr/bin/pg_config<br>
+<br>
+PYTHON_PSYCOPG2_INSTALL_<wbr>TARGET_OPTS += build_ext
--pg-config=$(STAGING_DIR)/<wbr>usr/bin/pg_config<br>
+<br>
+$(eval $(python-package))<br>
<span class="HOEnZb"><font color="#888888">--<br>
2.14.3<br>
<br>
______________________________<wbr>_________________<br>
buildroot mailing list<br>
<a href="mailto:buildroot@busybox.net">buildroot at busybox.net</a><br>
<a href="http://lists.busybox.net/mailman/listinfo/buildroot"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://lists.busybox.net/mailman/listinfo/buildroot&amp;source=gmail&amp;ust=1520936994553000&amp;usg=AFQjCNF0g03-hvo6DFfcvbxl6t7ldPQ_JA"
rel="noreferrer"
target="_blank">http://lists.busybox.net/<wbr>mailman/listinfo/buildroot</a><br>
</font></span></blockquote></div><br></div>
