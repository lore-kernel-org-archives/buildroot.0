From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Apr 2018 17:15:12 +0200
Subject: [Buildroot] [PATCH RFC] legal-info: add option to store
 manifest in rootfs
In-Reply-To: <e8f0d25b-5d96-9b31-4203-4074f804680c@gmail.com>
References: <20180426193252.19616-1-yann.morin.1998@free.fr>
 <20180427154650.3710e52e@windsurf>
 <fcf05ec0-3482-d265-c186-64492601e8a6@lucaceresoli.net>
 <20180427200245.GA14947@scaer>
 <0862ab07-5d01-eaf2-9da6-d50bf13f029f@lucaceresoli.net>
 <e8f0d25b-5d96-9b31-4203-4074f804680c@gmail.com>
Message-ID: <20180428151512.GA2922@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Florian, All,

On 2018-04-27 14:39 -0700, Florian Fainelli spake thusly:
[--SNIP--]
> Let's drop this, I was not thinking this would go into such a lengthy
> discussion,

That's been just 4-5 mails so far. This is *far* from being a lengthy
discussion, especialy by Buildroot standards! ;-]

> I will keep the local hack I have with make legal-info in
> post-build.sh. Thanks a lot for your help Yann!

Alternatively, you can use a br2-external tree, with:

  - Config.in is empty

  - external.desc contains:
        name: LEGAL_IN_TARGET
        desc: Isntall legal-info in rootfs

  - external.mk contains something like:
        target-finalize: legal-info

        TARGET_FINALIZE_LEGAL_INFO_DIR = $(TARGET_DIR)/usr/share/legal-info

        define TARGET_FINALIZE_LEGAL_INFO
            $(INSTALL) -D -m 0644 $(LEGAL_MANIFEST_CSV_TARGET) \
                $(TARGET_FINALIZE_LEGAL_INFO_DIR)/$(notdir $(LEGAL_MANIFEST_CSV_TARGET))
            mkdir -p $(TARGET_FINALIZE_LEGAL_INFO_DIR)/licenses
            cp -a $(LICENSE_FILES_DIR_TARGET)/* \
                $(TARGET_FINALIZE_LEGAL_INFO_DIR)/licenses/
        endef
        TARGET_FINALIZE_HOOKS += TARGET_FINALIZE_LEGAL_INFO

I've slightly tested that, and it seems to be working...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
