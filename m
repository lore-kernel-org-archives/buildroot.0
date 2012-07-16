From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 16 Jul 2012 05:14:32 +0200
Subject: [Buildroot] [PATCH 1 of 6 resend] pkg-download.mk: allow using
 localfiles outside of package infrastructure
In-Reply-To: <5002A868.70107@mind.be>
References: <patchbomb.1340343753@beantl019720>
 <1dcdff3e9437fc63cd4b.1340343754@beantl019720>
 <5002A868.70107@mind.be>
Message-ID: <CAAXf6LV10=X629e14iQA8Fx1m0R=YKnQzGUFNw6vOiGCHJiwvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thanks for your review and acks.

Op 15 jul. 2012 05:24 schreef "Arnout Vandecappelle" <arnout@mind.be> het
volgende:
>
> On 06/22/12 07:42, Thomas De Schampheleire wrote:
>>
>> The localfiles download method uses $($(PKG)_SITE))) and
>> $($(PKG)_SOURCE) instead of $(1) and $(2). This means that it can only
>> be used for package downloads (through gentargets, autotargets, ...)
>> and not for other downloads like external toolchains.
>>
>> This patch changes localfiles to allow this, just as the wget and scp
>> download methods already did.
>> For the version control download methods, nothing changes.
>
>
>  Is there any reason not to do it for the VCS download methods?
>

Just because I didn't really see how you'd use that. For non-package
downloads you'd be downloading a single file (typically a tarball). It
seems odd to me to take that from a version control system. I guess you'll
need to express the version you want in the URL, which may not be possible
for all the systems we support.
Thomas basically asked the same question. Do any of you do see a use case?

>
>>
>> Signed-off-by: Thomas De Schampheleire<thomas.de.schampheleire@gmail.com>
>>
>> ---
>>   package/pkg-download.mk |  8 ++++----
>>   1 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
>> --- a/package/pkg-download.mk
>> +++ b/package/pkg-download.mk
>> @@ -174,16 +174,16 @@ define SHOW_EXTERNAL_DEPS_WGET
>>   endef
>>
>>   define DOWNLOAD_LOCALFILES
>> -       test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
>> -               $(LOCALFILES) $(call qstrip,$(subst
file://,,$($(PKG)_SITE)))/$($(PKG)_SOURCE) $(DL_DIR)
>> +       test -e $(DL_DIR)/$(2) || \
>> +               $(LOCALFILES) $(call qstrip,$(subst file://,,$(1)))
$(DL_DIR)
>
>
>  Shouldn't this be
>                 $(LOCALFILES) $(call qstrip,$(subst file://,,$(1)))
$(DL_DIR)/$(2)

Well, the behavior is the same as before. But I guess you could safely add
the explicit destination. I can't test it as I'm on holiday, though.

Maybe you could submit that as a separate patch?

>
>
>>   endef
>>
>>   define SOURCE_CHECK_LOCALFILES
>> -  test -e $(call qstrip,$(subst
file://,,$($(PKG)_SITE)))/$($(PKG)_SOURCE)
>> +  test -e $(call qstrip,$(subst file://,,$(1)))
>>   endef
>>
>>   define SHOW_EXTERNAL_DEPS_LOCALFILES
>> -  echo $($(PKG)_SITE)/$($(PKG)_SOURCE)
>> +  echo $(2)
>
>
>  Funny, the original was actually wrong...
>
>  Regards,
>  Arnout
>
>>   endef
>>

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120716/4400a2a2/attachment.html>
