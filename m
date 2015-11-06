From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Fri, 6 Nov 2015 09:41:11 +0100
Subject: [Buildroot] [PATCH 2/2] package/systemd: Respect
 BR2_TARGET_GENERIC_GETTY_BAUDRATE
In-Reply-To: <CAFGQKxfgm1KvBR95ksPgha3XKaix_NPorSWfCcDmYYYOmhYdSw@mail.gmail.com>
References: <1446099102-5205-1-git-send-email-cyrilbur@gmail.com>
 <1446099102-5205-2-git-send-email-cyrilbur@gmail.com>
 <20151029171702.0fa0b81c@camb691>
 <CAFGQKxfgm1KvBR95ksPgha3XKaix_NPorSWfCcDmYYYOmhYdSw@mail.gmail.com>
Message-ID: <563C67A7.8050003@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/10/2015 11:41, Martin Bark wrote:
>>> +     if [ $(BR2_TARGET_GENERIC_GETTY_BAUDRATE) -gt 0 ] ; \
>>> +     then \
>>> +             $(SED) 's,115200,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE),' $(TARGET_DIR)/lib/systemd/system/$${SERVICE}@.service; \
>>> +     fi
> 
> $(BR2_TARGET_GENERIC_GETTY_BAUDRATE) will have double quotes around it
> which will need to be removed so i don't think the -gt test will ever
> work.  Have a look in package/skeleton/skeleton.mk where it uses
> $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE)) to strip the
> double quotes before it uses the value, you'll need to do something
> similar.

This test will work just fine, it will be expanded to e.g.

if [ "38400" -gt 0 ];

Which is a perfectly valid shell condition.  However, the sed will
introduce the double quotes in the systemd unit file.  Which,
according to the systemd documentation, is also fine in an ExecStart
statement, which somewhat mimic the behavior of the shell.
