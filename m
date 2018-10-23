From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 23 Oct 2018 23:20:07 +0300
Subject: [Buildroot] [PATCH 1/1] bdwgc: add optional cplusplus support
In-Reply-To: <57bbd766-94da-b00b-94f2-b8ede5e04955@mind.be>
References: <20181023193912.10656-1-fontaine.fabrice@gmail.com>
 <57bbd766-94da-b00b-94f2-b8ede5e04955@mind.be>
Message-ID: <87sh0w76vc.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, Fabrice,

Arnout Vandecappelle writes:
> On 10/23/18 8:39 PM, Fabrice Fontaine wrote:
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> ---
>>  package/bdwgc/bdwgc.mk | 14 +++++++++++++-
>>  1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
>> index 5603df8d9d..a0d7689d31 100644
>> --- a/package/bdwgc/bdwgc.mk
>> +++ b/package/bdwgc/bdwgc.mk
>> @@ -22,14 +22,26 @@ BDWGC_AUTORECONF = YES
>>  BDWGC_CFLAGS = $(TARGET_CFLAGS)
>>  ifeq ($(BR2_sparc),y)
>>  BDWGC_CFLAGS += -DAO_NO_SPARC_V9
>> +BDWGC_CPPFLAGS += -DAO_NO_SPARC_V9
>>  endif
>>  ifeq ($(BR2_STATIC_LIBS),y)
>>  BDWGC_CFLAGS += -DGC_NO_DLOPEN
>> +BDWGC_CPPFLAGS += -DGC_NO_DLOPEN
>>  endif
>>
>> +BDWGC_CONF_OPTS = \
>> +	CFLAGS="$(BDWGC_CFLAGS)" \
>> +	CPPFLAGS="$(BDWGC_CPPFLAGS)"
>
>  Is it useful to specify that twice? Isn't it enough to specify only CPPFLAGS?
> Maybe at the time this CFLAGS override was added (9d181bb93eb1, 3.5 years ago,
> by Baruch) CPPFLAGS didn't work but now it does? Or maybe it was an
> accident/convenience? The commit message doesn't say anything.

It seems like CFLAGS_EXTRA can be used to add flags to both CFLAGS and
CPPFLAGS. See configure.ac.

baruch

>> +
>>  # Ensure we use the system libatomic_ops, and not the internal one.
>> -BDWGC_CONF_OPTS = --with-libatomic-ops=yes CFLAGS="$(BDWGC_CFLAGS)"
>> +BDWGC_CONF_OPTS += --with-libatomic-ops=yes
>>  HOST_BDWGC_CONF_OPTS = --with-libatomic-ops=yes
>>
>> +ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
>> +BDWGC_CONF_OPTS += --enable-cplusplus
>> +else
>> +BDWGC_CONF_OPTS += --disable-cplusplus
>> +endif
>> +
>>  $(eval $(autotools-package))
>>  $(eval $(host-autotools-package))

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
