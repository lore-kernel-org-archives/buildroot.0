From: Michel Wilson <michel@crondor.net>
Date: Sat, 27 Sep 2008 18:15:39 +0200
Subject: [Buildroot] .la files libdir breakage
Message-ID: <200809271815.39682.michel@crondor.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have my buildroot working dir in /usr/local/src/buildroot. In 
package/Makefile.autotools.in, line 230, there is the following fragment:

    for i in $$(find $(STAGING_DIR)/usr/lib/ -name "*.la"); do \
        cp $$i $$i~; \
        $(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$i; \
    done

It blindly replaces all occurences of =/usr with =$(STAGING_DIR)/usr, in *all* 
.la-files in the staging dir, each time a package using autotools is 
installed. After installing a few of them, it results in the following madness 
(wrapped for clarity):

libdir='/usr/local/src/buildroot/build_i686/staging_dir/usr/local/src/buildro
ot/build_i686/staging_dir/usr/local/src/buildroot/build_i686/staging_dir/usr/
local/src/buildroot/build_i686/staging_dir/usr/local/src/buildroot/build_i686
/staging_dir/usr/local/src/buildroot/build_i686/staging_dir/usr/local/src/bui
ldroot/build_i686/staging_dir/usr/local/src/buildroot/build_i686/staging_dir/
usr/local/src/buildroot/build_i686/staging_dir/usr/local/src/buildroot/build_
i686/staging_dir/usr/local/src/buildroot/build_i686/staging_dir/usr/local/src
/buildroot/build_i686/staging_dir/usr/local/src/buildroot/build_i686/staging_
dir/usr/local/src/buildroot/build_i686/staging_dir/usr/local/src/buildroot/bu
ild_i686/staging_dir/usr/local/src/buildroot/build_i686/staging_dir/usr/local
/src/buildroot/build_i686/staging_dir/usr/local/src/buildroot/build_i686/stag
ing_dir/usr/lib'

Oops ;) Would it be an idea to patch the .la-files before installing them, 
when they are still in the build directory? I think this would ensure that 
they're only patched once.

Regards,

Michel.
-- 
Michel Wilson     michel at crondor.net
PGP key ID        0xD2CB4B7E
