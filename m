From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 30 Jan 2013 14:33:28 +0200
Subject: [Buildroot] [PATCH v3] pkg-infra: add <pkg>_CONFIG_FIXUP to fix
 *-config files
In-Reply-To: <51091293.1010108@petroprogram.com>
References: <1359402723-5603-1-git-send-email-stefan.froberg@petroprogram.com>
 <CAHXCMMK69aYc=Hebivu1wPJOn0CXMn9SHQCA=-G4_JAdaw5Sjg@mail.gmail.com>
 <51080BF1.3020009@mind.be> <51091293.1010108@petroprogram.com>
Message-ID: <51091318.6020304@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

30.1.2013 14:31, Stefan Fr?berg kirjoitti:
> 29.1.2013 19:50, Arnout Vandecappelle kirjoitti:
>> On 29/01/13 08:14, Samuel Martin wrote:
>>>>> +                       $(SED) 
>>>> "s,^\(exec_\)\?prefix=.*,\1prefix=$(STAGING_DIR)/usr,g" \
>>>>> +                               -e "s,-I/usr/,-I\${prefix}/usr/,g" \
>>>>> +                               -e
>>>> "s,-L/usr/,-L\${exec_prefix}/usr/,g" \
>>> Well, just fixing the (exec_)?prefix may not be enough in some case:
>>> Some quick grepping in the package directory will show that includedir
>>> and libdir should be fixed as well.
>>  I wouldn't want to do too much in the generic fixup script.
>>
>>  In fact, the -L substitution is not necessarily correct - some config
>> scripts may not define ${exec_prefix}. I'd rather use $(STAGING_DIR)
>> explicitly.
>>
>>  BTW, Stefan: the $ should have been quoted ($$).
>>
>>  Regards,
>>  Arnout
>>
> So like this ?
>
> -e 's,-I/usr/,-I$$(STAGING_DIR)/usr/,g" \
> -e 's,-L/usr/,-L$$(STAGING_DIR)/usr/,g" \
>
>
>
> I make one final v4 of that for FOSDEM then and that's that.
>
> Regards
> Stefan
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Ach, meant this:

-e 's,-I/usr/,-I$(STAGING_DIR)/usr/,g" \
-e 's,-L/usr/,-L$(STAGING_DIR)/usr/,g" \
