From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 2 Aug 2019 22:43:53 +0200
Subject: [Buildroot] [PATCH v3 1/1] pkg-infra/show-info: dump
 install_{staging, target} info
In-Reply-To: <93f8a09e-3dac-4a1c-aa2c-64f3ae51aeea@mind.be>
References: <20190731153237.13607-1-vadim4j@gmail.com>
 <93f8a09e-3dac-4a1c-aa2c-64f3ae51aeea@mind.be>
Message-ID: <41428ed5-ed81-067a-829c-00b3e2bdc3ab@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/08/2019 22:42, Arnout Vandecappelle wrote:
>  Hi Vadim,
> 
>  Sorry to come with yet another comment in v3 of this extremely simple patch :-)
> 
> On 31/07/2019 17:32, Vadim Kochan wrote:
>> provide info if the package will be installed to staging/target
>> destinations. Might be useful for analyzing the packages which
>> installed only for target/staging.
>>
>> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
>> ---
>> v2:
>>     1) use oneliner 'if' to dump install_{staging,target} properties
>>
>> v3:
>>     1) fix evaluation of true/false value via 'subst' (suggested by Yann E. Morin)
>>
>>  package/pkg-utils.mk | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
>> index b7280e930f..ffe198e242 100644
>> --- a/package/pkg-utils.mk
>> +++ b/package/pkg-utils.mk
>> @@ -94,6 +94,8 @@ endef
>>  define _json-info-pkg-details
>>  	"version": "$($(1)_DL_VERSION)",
>>  	"licenses": "$($(1)_LICENSE)",
>> +	"install-target": $(if $(subst NO,,$($(1)_INSTALL_TARGET)),true,false),
>> +	"install-staging": $(if $(subst NO,,$($(1)_INSTALL_STAGING)),true,false),

 Oh, also, someone commented that you should keep install_staging with
underscore because we already have reverse_dependencies.

 Regards,
 Arnout

> 
>  I still find this ugly.
> 
>  Could you instead add a macro that does something like
> $(subst NO,false,$(subst YES,true,$(1)))
> and use that?
> 
>  It may also be handy in other situations.
> 
>  I'm not sure what to call it, maybe bool-to-json or yesno-to-bool
> 
>  Regards,
>  Arnout
> 
>>  	"downloads": [
>>  	$(foreach dl,$(sort $($(1)_ALL_DOWNLOADS)),
>>  		{
>>
