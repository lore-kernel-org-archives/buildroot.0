From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 Jun 2014 22:07:14 +0200
Subject: [Buildroot] [PATCH] graph-depends: fix when $(O) is a relative
 path
In-Reply-To: <20140620200457.GA3543@free.fr>
References: <1403129424-27129-1-git-send-email-arnout@mind.be>
 <20140620200457.GA3543@free.fr>
Message-ID: <53A49472.4050109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/06/14 22:04, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2014-06-19 00:10 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>> The graph-depends commands cd into the CONFIG_DIR and run the script
>> from there. However, this means that when $(O) is a relative path, it
>> will no longer be correct.  Therefore, use $(BASE_DIR) instead of $(O).
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> Tested with this sequence:
>     cd buildroot
>     make manual-html
>     make O=../br.build-1 manual-html
>     cd ..
>     make -C buildroot O=../br.build-2 manual-html
>     make -C buildroot O=$(pwd)/br.build-3
>     mkdir br.build-4
>     cd br.build-4
>     make defconfig   (to create the Makefile wrapper)
>     make manual-html

 Call me stupid, but why is it relevant to test this patch with manual-html?

 Regards,
 Arnout

> 
> All generate the HTML manual, and a cursory look does not show any
> diference.
> 
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Regards,
> Yann E. MORIN.
> 
>> ---
>>  Makefile | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 5c82355..dd350b6 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -676,8 +676,8 @@ graph-depends:
>>  	@$(INSTALL) -d $(O)/graphs
>>  	@cd "$(CONFIG_DIR)"; \
>>  	$(TOPDIR)/support/scripts/graph-depends $(BR2_GRAPH_DEPS_OPTS) \
>> -	|tee $(O)/graphs/$(@).dot \
>> -	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(O)/graphs/$(@).$(BR_GRAPH_OUT)
>> +	|tee $(BASE_DIR)/graphs/$(@).dot \
>> +	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(BASE_DIR)/graphs/$(@).$(BR_GRAPH_OUT)
>>  
>>  else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
>>  
>> -- 
>> 2.0.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
