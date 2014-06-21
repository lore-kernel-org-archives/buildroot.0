From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 21 Jun 2014 11:04:22 +0200
Subject: [Buildroot] [PATCH 1 of 3 v2] infra: support buildroot being
 located in /usr
In-Reply-To: <53A4BF2B.1000405@mind.be>
References: <patchbomb.1403291463@localhost>
 <2969a1777632f4df4615.1403291464@localhost>
 <53A4BF2B.1000405@mind.be>
Message-ID: <CAAXf6LUkH-0ODtGpk2--fbknnjCFeoMUNAC28S+wKrg7nedUYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 21, 2014 at 1:09 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 20/06/14 21:11, Thomas De Schampheleire wrote:
>> pkg-generic and pkg-autotools both perform sed replacements of /usr to
>> $(STAGING_DIR)/usr, in .pc and .la files respectively. However, if buildroot
>> itself is located in /usr, then STAGING_DIR also starts with /usr, and naive
>> replacements of '/usr' can result in paths of the form:
>>     /usr/buildroot/.../sysroot/usr/buildroot/.../sysroot/...
>>
>> This patch makes the replacements more careful, by first replacing the known
>> paths BASE_DIR and STAGING_DIR to tokens, then performing the actual
>> replacement, and finally replacing the tokens with the corresponding paths.
>>
>> Additionally it removes the unnecessary making of a backup copy in
>> pkg-autotools.
>>
>> Partially fixes bug #5750 (https://bugs.busybox.net/show_bug.cgi?id=5750)
>>
>> Partially-based-on-a-patch-from: Ben Stoltz <benstoltz@gmail.com>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> ---
>> v2: s/Jeremy Kerr/Ben Stoltz/
>>
>>  package/pkg-autotools.mk |   8 ++++++--
>>  package/pkg-generic.mk   |  10 +++++++---
>>  2 files changed, 13 insertions(+), 5 deletions(-)
>>
>> diff -r a59338f65a46 -r 2969a1777632 package/pkg-autotools.mk
>> --- a/package/pkg-autotools.mk        Wed Jun 18 20:22:00 2014 +0400
>> +++ b/package/pkg-autotools.mk        Fri Jun 20 21:09:35 2014 +0200
>> @@ -268,8 +268,12 @@
>>  define $(2)_INSTALL_STAGING_CMDS
>>       $$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
>>       for i in $$$$(find $$(STAGING_DIR)/usr/lib* -name "*.la"); do \
>> -             cp -f $$$$i $$$$i~; \
>> -             $$(SED) "s:\(['= ]\)/usr:\\1$$(STAGING_DIR)/usr:g" $$$$i; \
>> +             $$(SED) "s:$$(BASE_DIR):@BASE_DIR@:g" \
>> +                     -e "s:$$(STAGING_DIR):@STAGING_DIR@:g" \
>
>  STAGING_DIR contains BASE_DIR, so this second expression will never match
> anymore, no? It would match if you swap the two expressions, but there is not
> much reason I think.

I originally had the STAGING_DIR token alone, but it caused a problem
still. Then I took over the BASE_DIR expression from Ben Stoltz'
patch, which also kept the STAGING_DIR.
I think you are right that only the BASE_DIR replacement is needed.
After all, this is where the problematic /usr is. I will try this out
for simplicity's sake...

Thanks,
Thomas
