From: =?UTF-8?Q?Guillaume_GARDET_-_Olis=c3=a9o?= <guillaume.gardet@oliseo.fr>
Date: Wed, 22 Jul 2015 15:30:54 +0200
Subject: [Buildroot] [PATCH] c-icap: fix config script by adding
 $(STAGING_DIR) prefix to link path. It fixes c-icap-modules build.
In-Reply-To: <20150722145503.01f5bd26@free-electrons.com>
References: <1437568841-20180-1-git-send-email-guillaume.gardet@oliseo.fr>
 <20150722145503.01f5bd26@free-electrons.com>
Message-ID: <55AF9B0E.8080803@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 22/07/2015 14:55, Thomas Petazzoni a ?crit :
> Guillaume,
>
> Thanks for the patch!
>
> On Wed, 22 Jul 2015 14:40:41 +0200, Guillaume GARDET wrote:
>> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
>>
>> ---
>>   package/c-icap/c-icap.mk | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
>> index 0f42b6c..00a250b 100644
>> --- a/package/c-icap/c-icap.mk
>> +++ b/package/c-icap/c-icap.mk
>> @@ -57,6 +57,8 @@ define C_ICAP_TUNE_INSTALLATION
>>   		$(STAGING_DIR)/usr/bin/{c-icap,c-icap-libicapapi}-config
>>   	$(SED) 's%INCDIR2=.*%INCDIR2=$(STAGING_DIR)/usr/include/c_icap%' \
>>   		$(STAGING_DIR)/usr/bin/{c-icap,c-icap-libicapapi}-config
>> +	$(SED) 's%LIBS="-L%LIBS="-L$(STAGING_DIR)%' \
>> +		$(STAGING_DIR)/usr/bin/c-icap-libicapapi-config
> Ah, right, I missed this one! However, I think it's useless to keep
> this -L option, this $(STAGING_DIR)/usr/lib is already in the library
> search path for the cross-compiler.
>
> What about just:
>
> 	$(SED) 's%-L$LIBDIR %%' $(STAGING_DIR)/usr/bin/c-icap-libicapapi-config

Ok, but $ sign must be escaped with another $:
         $(SED) 's%-L$$LIBDIR %%' $(STAGING_DIR)/usr/bin/c-icap-libicapapi-config

Do you want a I send a V2 with this solution?


Guillaume

>
> Thanks,
>
> Thomas
