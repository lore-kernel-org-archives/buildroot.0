Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B656C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48BE240185;
	Sat,  8 Jan 2022 22:39:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KVRx51TM63pA; Sat,  8 Jan 2022 22:38:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E75C340220;
	Sat,  8 Jan 2022 22:38:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 656AF1BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 620B24021E
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9UBT0L0kNxSg for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:38:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A35A401A6
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:38:32 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h10so8611252wrb.1
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 14:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UIhDph7QSbF9sDUS4vSXPkX+no05tht6b9Uyw9qDJGY=;
 b=dlqhTvNNuIltkhY/OKuu3NMb96EQBYkEH5N5lpdANCQBhIH5bGTj7UbyRF5xnZTMoM
 0Wr4+bBDCPgAnAWfohMem+TnJm1sjw/jwJ3aXWeRYEEUaesMTAB39hTS9o57gQyzRgIy
 8/jjk2eTa8ccfkc38LdOTpCjTK6YZCuAUOy6M9aS8aTyrYuNaM6mt7kX4a0yHxGmvF63
 V5PuU6jzh2lz/GdgWXYiJh48f38Ve7unr3Kj7pqOntdx51z7iQEDrhbroqccx/1e9o5C
 9mW7O4cRf7XowYCgXNRavq6qTAms1K0ioXGi5XBP2jtd2dzjLmkq6NunN4pZcLeTylU9
 V3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UIhDph7QSbF9sDUS4vSXPkX+no05tht6b9Uyw9qDJGY=;
 b=MKygNcKqbpEqCSMiCEew9e5nABp2kgxfY3P7qS6OZRVOqEOI7i5NhGwBNo8WvtS0Mg
 9XrgQpWHiUPCcdTJg+3NJJIljKmrX1jEt37FMetnwTez1l5DAyyH5CgWxM7uWUveCRyZ
 PcQznkb1WaEjZYFisspFz6COjfs6fpXwfsrti3+Ax74hAtOLdrbSX4N8EE/A4moefbpU
 fVjxgIrCRIYLj6NLKYljlpOKGgAp9sjpgXOiByhk2LKSohyARB2Obak3Yby/o2h647kF
 B/30wLnUvIIUryNVwNJzSRPJth5K8hFX/nCvcAxirGvflJXKipHi1a0SEhSaQXJHbidl
 4H2w==
X-Gm-Message-State: AOAM532O69z8AdjvgXAdXl9mSuGj9CKnIFHBMEdXqxhlNCwbPcp+2AFt
 LrWRw8VoT6V7usDk9g0UG/FHVg==
X-Google-Smtp-Source: ABdhPJzVICwsaJAwOa4tMTjPrne6DzMPhQxpzgYFMQG7Lvpyf8PWrL8/QmnFVHF8Z5NBOsJyfdPz7A==
X-Received: by 2002:adf:ef52:: with SMTP id c18mr58026086wrp.162.1641681510669; 
 Sat, 08 Jan 2022 14:38:30 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id e5sm2935627wrq.116.2022.01.08.14.38.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 14:38:30 -0800 (PST)
Message-ID: <6025dff1-66cb-f56e-21ad-41042efc5517@mind.be>
Date: Sat, 8 Jan 2022 23:38:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>
References: <20201126144745.502228-1-nolange79@gmail.com>
 <eae1a293-c218-3527-db3b-cd71c94135b3@mind.be>
 <CADYdroM-xNg-4XBbPh0bUhmgqr41j9f_CR-ou_Y3UgOy88+sfw@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADYdroM-xNg-4XBbPh0bUhmgqr41j9f_CR-ou_Y3UgOy88+sfw@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH v3 1/1] package/systemd: add support for
 creating journal catalog DB
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/01/2022 22:46, Norbert Lange wrote:
> Am Sa., 8. Jan. 2022 um 20:41 Uhr schrieb Arnout Vandecappelle <arnout@mind.be>:
>>
>>    Hi Norbert,
>>
>> On 26/11/2020 15:47, Norbert Lange wrote:
>>> journald supports catalog files, or rather a binary database of
>>> those.
>>> Functionality added includes:
>>>
>>> -   A config option allows enabling the binary database.
>>>
>>> -   if the option is enabled, the database is built and moved to
>>>       /usr/share/factory. A symlink is created in /var pointing to
>>>       that file.
>>>       If BR2_ENABLE_LOCALE_PURGE is enabled, the catalogs not in the
>>>       language whitelist are deleted first.
>>>
>>> -   the service normally used for creating the DB during boot,
>>>       and the catalog source files used as input are deleted.
>>>
>>> The move to /usr/share/factory is helpful for having /usr as whole
>>> system distribution.
>>>
>>> Signed-off-by: Norbert Lange <nolange79@gmail.com>
>>
>>    I was going to apply a second time, but then I noticed that I made some
>> comments on v2 [1] that you haven't answered to and I still think they're valid.
>> So I've marked this patch as Changes Requested.
> 
> I did reply and cover the comments in [2], not sure whats missing?
> Separating into 2 independent patches is not really helpfull IMHO.

  Oops, you're right. I'll look at the patch again tomorrow morning.

  Regards,
  Arnout

> 
>>
>>    If you respin, please also include in the commit message the additional
>> explanations you made in reply to Romain.
>>
>>    Regards,
>>    Arnout
>>
>> [1] https://lore.kernel.org/buildroot/1d09c49a-6d08-1cd7-9785-92b56c17ae06@mind.be/
>>
>>
>>> ---
>>> v1->v2:
>>> -   Moved all logic into systemd.mk
>>> -   solved the LOCALE_PURGE order that way
>>> -   use the factory to store the file
>>> -   option to enable the DB (similar to udev HWDB)
>>> -   cant be anabled with !ROOTFS_RW, tons of
>>>       issues with that one
>>> v2->v3:
>>> -   use backticks instead of $$()
>>> -   be more explicit about what happens in
>>>       SYSTEMD_LOCALE_PURGE_CATALOGS
>>>
>>> Signed-off-by: Norbert Lange <nolange79@gmail.com>
>>> ---
>>>    package/systemd/Config.in  | 14 +++++++++++++
>>>    package/systemd/systemd.mk | 41 ++++++++++++++++++++++++++++++++++++++
>>>    2 files changed, 55 insertions(+)
>>>
>>> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
>>> index ec34478e3d..d576e6035b 100644
>>> --- a/package/systemd/Config.in
>>> +++ b/package/systemd/Config.in
>>> @@ -269,6 +269,20 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
>>>
>>>          http://www.freedesktop.org/software/systemd/man/machinectl.html#Image%20Transfer%20Commands
>>>
>>> +config BR2_PACKAGE_SYSTEMD_CATALOGDB
>>> +     bool "enable journal catalog database installation"
>>> +     depends on BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW # conflicting tmpfiles magic
>>> +     help
>>> +       Build and install the journal catalog database.
>>> +
>>> +       catalog files are used to provide extended and potentially localized
>>> +       messages for the journal.
>>> +
>>> +       The original catalog files will be built into a DB at
>>> +       /usr/share/factory/var/lib/systemd/catalog/database.
>>> +
>>> +       https://www.freedesktop.org/wiki/Software/systemd/catalog/
>>> +
>>>    config BR2_PACKAGE_SYSTEMD_LOCALED
>>>        bool "enable locale daemon"
>>>        help
>>> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
>>> index cb12f667d6..ae99c02abf 100644
>>> --- a/package/systemd/systemd.mk
>>> +++ b/package/systemd/systemd.mk
>>> @@ -613,6 +613,47 @@ define SYSTEMD_INSTALL_INIT_SYSTEMD
>>>        $(SYSTEMD_INSTALL_NETWORK_CONFS)
>>>    endef
>>>
>>> +ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
>>> +define SYSTEMD_LOCALE_PURGE_CATALOGS
>>> +     # go through all files with scheme <basename>.<langext>.catalog
>>> +     # and remove those where <langext> is not in LOCALE_NOPURGE
>>> +     for cfile in `find $(TARGET_DIR)/usr/lib/systemd/catalog -name '*.*.catalog'`; \
>>> +     do \
>>> +             basename=$${cfile##*/}; \
>>> +             basename=$${basename%.catalog}; \
>>> +             langext=$${basename#*.}; \
>>> +             [ "$$langext" = "$${basename}" ] && continue; \
>>> +             expr '$(LOCALE_NOPURGE)' : ".*\b$${langext}\b" >/dev/null && continue; \
>>> +             rm -f "$$cfile"; \
>>> +     done
>>> +endef
>>> +
>>> +SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_LOCALE_PURGE_CATALOGS
>>> +endif
>>> +
>>> +ifeq ($(BR2_PACKAGE_SYSTEMD_CATALOGDB),y)
>>> +define SYSTEMD_UPDATE_CATALOGS
>>> +     $(HOST_DIR)/bin/journalctl --root=$(TARGET_DIR) --update-catalog
>>> +     install -D $(TARGET_DIR)/var/lib/systemd/catalog/database \
>>> +             $(TARGET_DIR)/usr/share/factory/var/lib/systemd/catalog/database
>>> +     rm $(TARGET_DIR)/var/lib/systemd/catalog/database
>>> +     ln -sf /usr/share/factory/var/lib/systemd/catalog/database \
>>> +             $(TARGET_DIR)/var/lib/systemd/catalog/database
>>> +     grep -q '^L /var/lib/systemd/catalog/database' $(TARGET_DIR)/usr/lib/tmpfiles.d/var.conf || \
>>> +             printf "\nL /var/lib/systemd/catalog/database\n" >> $(TARGET_DIR)/usr/lib/tmpfiles.d/var.conf
>>> +endef
>>> +
>>> +SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_UPDATE_CATALOGS
>>> +endif
>>> +
>>> +define SYSTEMD_RM_CATALOG_UPDATE_SERVICE
>>> +     rm -rf $(TARGET_DIR)/usr/lib/systemd/catalog \
>>> +             $(TARGET_DIR)/usr/lib/systemd/system/systemd-journal-catalog-update.service \
>>> +             $(TARGET_DIR)/usr/lib/systemd/system/*/systemd-journal-catalog-update.service
>>> +endef
>>> +
>>> +SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_CATALOG_UPDATE_SERVICE
>>> +
>>>    define SYSTEMD_PRESET_ALL
>>>        $(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset-all
>>>    endef
>>>
> 
> Norbert
> 
> [2] - https://lore.kernel.org/buildroot/1d09c49a-6d08-1cd7-9785-92b56c17ae06@mind.be/
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
