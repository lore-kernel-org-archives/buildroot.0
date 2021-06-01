From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Jun 2021 23:13:10 +0200
Subject: [Buildroot] [PATCHv4 15/16] package/pkg-meson.mk: determine
 'buildtype' based on BR2_ENABLE_RUNTIME_DEBUG iso BR2_ENABLE_DEBUG
In-Reply-To: <20210601203017.GB168928@scaer>
References: <20210601143422.25064-1-patrickdepinguin@gmail.com>
 <20210601143422.25064-16-patrickdepinguin@gmail.com>
 <20210601203017.GB168928@scaer>
Message-ID: <af8620df-c12b-0142-0a2f-db387348b6fd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/06/2021 22:30, Yann E. MORIN wrote:
> Thomas, All,
> 
> Eric, and other meson experts: question for you below...
> 
> On 2021-06-01 16:34 +0200, Thomas De Schampheleire spake thusly:
>> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>>
>> BR2_ENABLE_DEBUG should just steer the availability of debug symbols and
>> should have no negative effect on performance.
>>
>> Introduction of 'assert' statements, 'debug'-type builds with additional
>> logging, etc. should be steered by BR2_ENABLE_RUNTIME_DEBUG instead.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>> ---
>>  package/pkg-meson.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
>> index a57820d4d2..dafad3b1eb 100644
>> --- a/package/pkg-meson.mk
>> +++ b/package/pkg-meson.mk
>> @@ -89,7 +89,7 @@ define $(2)_CONFIGURE_CMDS
>>  		--prefix=/usr \
>>  		--libdir=lib \
>>  		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
>> -		--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
>> +		--buildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
> 
> I agree on this specific change.
> 
> However, more globally: 'buildtype' governs two settings [0]: 'debug'
> and 'optimisation'. The 'optimisation' part is already part of our
> CFLAGS, so we don't need to drive it from meson.
> 
> So, I think that what we need, is to just set the 'debug' option, rather
> than the full 'buildtype'.

 I discussed this at length with Thomas in v3 of the patch.

 Basically, buildtype governs 3 things (for gcc - the situation is vastly more
complicated on windows):

- debug
- optimisation
- b_ndebug

 Ideally, we'd like to set buildtype to "do nothing", otherwise it's going to
set debug/optimisation flags that conflict with what we set in cflags. Of
course, there's no such option.

 Alternatively, we set debug, optimisatoin and b_ndebug explicitly. However, for
debug there's just on or off, while we have levels. For optimisation, we'd have
to map our optimisation levels to the meson optimisation levels, so that's
possible. And b_ndebug is what we could set based on BR2_ENABLE_RUNTIME_DEBUG.
And if we in the end decide to set -DNDEBUG globally, then we could simply leave
b_ndebug alone. But this is a lot of complexity for not really any gain.

 So Thomas and I said: let's keep things like they are at the moment, i.e. this
patch.

 Regards,
 Arnout

> 
> Thoughts?
> 
> [0] https://mesonbuild.com/Builtin-options.html#core-options
> 
>>  		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
>>  		-Dstrip=false \
>>  		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
>> -- 
>> 2.26.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
