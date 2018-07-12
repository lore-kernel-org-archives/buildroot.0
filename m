From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 12 Jul 2018 22:02:18 +0300
Subject: [Buildroot] [PATCH v2 2/2] coreutils: optimize the '[' symlink
In-Reply-To: <7ebb787a-3798-5534-9cef-2012943d50ad@mind.be>
References: <2b42d6f4f947a7423813916cd6f8e5f37c5b113a.1531338679.git.baruch@tkos.co.il>
 <5821c4c9a85e95a15423616c8a7f674df515b714.1531338679.git.baruch@tkos.co.il>
 <7ebb787a-3798-5534-9cef-2012943d50ad@mind.be>
Message-ID: <87va9kffb9.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Arnout Vandecappelle writes:
> On 11-07-18 21:51, Baruch Siach wrote:
>> Link '[' directly to the coreutils binary instead of going through
>> 'test'.
>
>  One more small question: did you do a runtime test to be sure that this
> actually works? (That said, if this doesn't work, then the previous one also
> can't have worked.)

Tested in chroot now:
# readlink /usr/bin/[
coreutils
# if /usr/bin/[ 0 -eq 0 ]; then echo true; else echo false; fi
true
# if /usr/bin/[ 1 -eq 0 ]; then echo true; else echo false; fi
false

baruch

>> Suggested-by: Arnout Vandecappelle <arnout@mind.be>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>> v2: New patch in this series
>> ---
>>  package/coreutils/coreutils.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
>> index 2fb4a32c794f..7e7251ff7396 100644
>> --- a/package/coreutils/coreutils.mk
>> +++ b/package/coreutils/coreutils.mk
>> @@ -112,7 +112,7 @@ endif
>>  
>>  define COREUTILS_CLEANUP
>>  	# link for archaic shells
>> -	ln -fs test $(TARGET_DIR)/usr/bin/[
>> +	ln -fs coreutils $(TARGET_DIR)/usr/bin/[
>>  	# gnu thinks chroot is in bin, debian thinks it's in sbin
>>  	rm -f $(TARGET_DIR)/usr/bin/chroot
>>  	ln -sf ../bin/coreutils $(TARGET_DIR)/usr/sbin/chroot

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
