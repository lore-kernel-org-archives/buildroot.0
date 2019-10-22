From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 09:45:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/libselinux: fix build with
 python 3.8
In-Reply-To: <20191022094025.0ae71f35@windsurf>
References: <20191020203119.99538-1-james.hilliard1@gmail.com>
 <20191021210603.59270fc2@windsurf>
 <CADvTj4ojPDhL1M3L=yzSzJh=zp+8rO0pTBYYcGHH5=CBs6n90w@mail.gmail.com>
 <20191021231848.57832d2e@windsurf>
 <20191022094025.0ae71f35@windsurf>
Message-ID: <20191022094500.48f222d8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Oct 2019 09:40:25 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> So as you can see linking against libpython is *not* the solution, it
> is just a workaround for another real problem. I have not found (yet)
> what is the problem with the versioning script, but I guess we should
> research in this direction.

So, it is not the versioning script. In fact, when testing I removed
both the --version-script option and the -z defs option. But it is
actually the -z defs option that causes the problem.

And indeed:

       -z defs

           Report unresolved symbol references from regular object
           files.  This is done even if the linker is creating a
           non-symbolic shared library.  The switch
           --[no-]allow-shlib-undefined controls the behaviour for
           reporting unresolved references found in shared libraries
           being linked in.

Using -z defs in this particular case doesn't make any sense: we do
acknowledge that we can have remaining unresolved symbols. Then will be
provided by the Python interpreter.

So I believe the right fix is:

+++ src/Makefile	2019-10-22 09:44:26.700158005 +0200
@@ -165,7 +165,7 @@
 	$(CC) $(filter-out -Werror, $(CFLAGS)) $(PYINC) -fPIC -DSHARED -c -o $@ $<
 
 $(AUDIT2WHYSO): $(AUDIT2WHYLOBJ) $(LIBSEPOLA)
-	$(CC) $(CFLAGS) $(LDFLAGS) -L. -shared -o $@ $^ -lselinux $(LDLIBS_LIBSEPOLA) $(PYLIBS) -Wl,-soname,audit2why.so,--version-script=audit2why.map,-z,defs
+	$(CC) $(CFLAGS) $(LDFLAGS) -L. -shared -o $@ $^ -lselinux $(LDLIBS_LIBSEPOLA) $(PYLIBS) -Wl,-soname,audit2why.so,--version-script=audit2why.map
 
 %.o:  %.c policy.h
 	$(CC) $(CFLAGS) $(TLSFLAGS) -c -o $@ $<

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
