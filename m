From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 9 May 2018 10:30:37 -0500
Subject: [Buildroot] [PATCH] xfsprogs: bump to 4.16.1
In-Reply-To: <CANQCQpZ6_vZT5bvgX36ANzJtAafA3YQ48ziXw1te1mG6Sc-POw@mail.gmail.com>
References: <1525876323-62495-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20180509165536.14b0c47b@windsurf.home>
 <CANQCQpZ6_vZT5bvgX36ANzJtAafA3YQ48ziXw1te1mG6Sc-POw@mail.gmail.com>
Message-ID: <CANQCQpafU4LUcCKy3qQp0LYbMM40wrcCqMGB=F55G4muxD=WOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, May 9, 2018 at 10:04 AM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Thomas,
>
> On Wed, May 9, 2018 at 9:55 AM, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>> Hello,
>>
>> On Wed,  9 May 2018 09:32:03 -0500, Matt Weber wrote:
>>
>>> diff --git a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch b/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch

>>> diff --git a/package/xfsprogs/0005-xfs_scrub-fix-cross-compile-with-libunistring.patch b/package/xfsprogs/0005-xfs_scrub-fix-cross-compile-with-libunistring.patch

So between the above two patches, the behavior where we remove
$(LIBUNISTRING) in the 0005 isn't needed when switching to $(LIBICU),
as configure defines that variable only when icu is detected.  I've
kicked off a test-pkg config for icu enabled/disabled with the
following update to my v1 of this patchset.

--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -20,6 +20,10 @@ XFSPROGS_CONF_OPTS = \
        INSTALL_GROUP=root \
        --enable-static

+ifeq ($(BR2_PACKAGE_ICU),y)
+XFSPROGS_DEPENDENCIES += icu
+endif
+
 XFSPROGS_INSTALL_TARGET_OPTS = DIST_ROOT=$(TARGET_DIR) install

 $(eval $(autotools-package))
