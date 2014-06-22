From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 22 Jun 2014 13:29:27 -0400
Subject: [Buildroot] [PATCH 1 of 5 RFC] uclibc: menuconfig: take into
 account initial settings from config file
In-Reply-To: <f2f7913c-0555-46d8-9e41-9a8099a8c683@email.android.com>
References: <patchbomb.1403444739@localhost>
 <97d74ccbe054d9a16465.1403444740@localhost>
 <20140622185233.0d553f8d@free-electrons.com>
 <f2f7913c-0555-46d8-9e41-9a8099a8c683@email.android.com>
Message-ID: <CANxTyt5VxZd9gKc7Ft-3UDxyWSSsb+iP3vrAVd1m=6vr54KPgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

How about moving the XXX_COPY_CONFIG to the top of the
.stamp_config_file_fixed actions, and then make xxxx-menuconfig update
on that too?

That might be nicer than, say, changing the added COPY in the
xxxx-menuconfig to a "[ -f $(XXXX_BUILD_CONFIG) ] ||
$(XXXX_COPY_CONFIG)"

Danomi -

On Sun, Jun 22, 2014 at 1:23 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> schreef:
>>Dear Thomas De Schampheleire,
>>
>>On Sun, 22 Jun 2014 15:45:40 +0200, Thomas De Schampheleire wrote:
>>
>>>  uclibc-menuconfig: uclibc-patch
>>> +    $(UCLIBC_COPY_DOT_CONFIG)
>>
>>But then if I repeatedly do several uclibc-menuconfig to adjust the
>>configuration, before restarting the build, I'm going to loose my
>>changes, no?
>>
>>Say that UCLIBC_CONFIG_FILE=package/uclibc/uclibc-0.9.33.x.config, and
>>the following sequence of event:
>>
>> 1/ Make uclibc-menuconfig. The $(UCLIBC_CONFIG_FILE) gets copied to
>>    $(BUILD_DIR)/uclibc-<version>/.config.
>>
>>    I make a change in the uClibc configuration. It gets saved as
>>    $(BUILD_DIR)/uclibc-<version>/.config.
>>
>> 2/ I do make uclibc-menuconfig again, because I forgot something. The
>>    $(UCLIBC_CONFIG_FILE) gets copied to
>>    $(BUILD_DIR)/uclibc-<version>/.config. I've lost the change I've
>>    made in step (1).
>>
>>Am I missing something?
>
> No, I think you are right. We'll need an intermediate target in between, that it's run once after a clean I guess...
>
> Best regards,
> Thomas
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
