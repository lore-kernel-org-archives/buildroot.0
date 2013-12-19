From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 19 Dec 2013 14:23:50 +0100
Subject: [Buildroot] [PATCH] lvm2: disable statical building because it
	fails
In-Reply-To: <20131219114349.108e1147@skate>
References: <1387263739-3831-1-git-send-email-fabio.porcedda@gmail.com>
 <20131217101137.5c8845a3@skate>
 <CAHkwnC9+nr6zX7n-ZYoak-=iT1ZysDL8UoNGe2H7ghuFscS8Ew@mail.gmail.com>
 <20131219114349.108e1147@skate>
Message-ID: <CAHkwnC8bbeRtZ4BKHWtr0i0XcpKT8UvSYdU2DyxU51vr=aRq0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 19, 2013 at 11:43 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Thu, 19 Dec 2013 11:36:51 +0100, Fabio Porcedda wrote:
>
>> > Thanks, but you forgot to propagate this new dependency to the reverse
>> > dependencies of lvm2, and you forgot to add the corresponding comment.
>> > See
>> > http://buildroot.org/downloads/manual/manual.html#dependencies-target-toolchain-options.
>>
>> Ok, thanks, i will send an updated patch.
>
> Looking more at the problem, isn't it possible to fix the static build
> of LVM2, rather than preventing LVM2 from being selected in this case?

Yes, i've found a way to fix that.

First is a fix to buildroot adding:
+LVM2_CONF_OPT += --enable-static_link

The second one is a bug within lvm2 when using static building.
diff --git a/home/fabiopo/tmp/Makefile.in
b/output/build/lvm2-2.02.103/libdm/Makefile.in
index 7b40bde..bddb0a0 100644
--- a/home/fabiopo/tmp/Makefile.in
+++ b/output/build/lvm2-2.02.103/libdm/Makefile.in
@@ -40,7 +40,6 @@ endif

 ifeq ("@STATIC_LINK@", "yes")
 LIB_STATIC = $(interface)/libdevmapper.a
-TARGETS += libdevmapper.a
 endif

 LIB_SHARED = $(interface)/libdevmapper.$(LIB_SUFFIX)
@@ -65,9 +64,6 @@ device-mapper: all
 libdevmapper.$(LIB_SUFFIX) libdevmapper.$(LIB_SUFFIX).$(LIB_VERSION):
$(LIB_SHARED)
        $(LN_S) -f $< $@

-libdevmapper.a: $(LIB_STATIC)
-       $(LN_S) -f $< $@
-

I will prepare a patch to fix lvm2 static building.

Best regards
-- 
Fabio Porcedda
