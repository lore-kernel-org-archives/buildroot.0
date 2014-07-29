From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 29 Jul 2014 22:39:03 +0200
Subject: [Buildroot] [PATCH v2 1/1] Rebuild packages when their external
 config is updated
In-Reply-To: <20140729213837.1b147511@free-electrons.com>
References: <1400253776-21759-1-git-send-email-sojka@merica.cz>
 <1400253776-21759-2-git-send-email-sojka@merica.cz>
 <20140729213837.1b147511@free-electrons.com>
Message-ID: <CAAXf6LXBMAX3mw++yuzr7gJK0TV4JgOwg6bYVr4tCGi-bwV0aw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Tue, Jul 29, 2014 at 9:38 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Michal Sojka,
>
> On Fri, 16 May 2014 17:22:56 +0200, Michal Sojka wrote:
>> Packages like busybox, Linux kernel or uclibc can "import" their
>> configuration files from external location specified either in
>> buildroot's .config or in an environment variable. Currently, this
>> import happens only when the package is built for the first time. When
>> the external config changes later, the package is not rebuilt with the
>> updated configuration until the corresponding .stamp_configured file
>> is manually deleted. This patch changes this to automatically rebuild
>> the package, when its external configuration files is newer than
>> .stamp_configured.
>>
>> The change is implemented in pkg-generic.mk so it automatically
>> applies to all packages that use external config.
>>
>> This patch also changes $(pkg)-update-config targets, which export the
>> internally used config files to external locations, to not change the
>> modification time of the external config. This ensures that the
>> package is not rebuilt just because its config file was exported.
>>
>> Finally, linux.mk used variable KERNEL_SOURCE_CONFIG to hold the file
>> name of the external config. This was renamed to LINUX_SOURCE_CONFIG,
>> in order to be compatible with the change in pkg-generic.mk.
>>
>> Signed-off-by: Michal Sojka <sojka@merica.cz>
>
> Thanks for your patch. But following Gustavo's and Yann's feedback, we
> decided to reject this approach. The user should start the rebuild of
> the package manually after changing the configuration.
>
> Note that there is currently an on-going work by Thomas De
> Schampheleire on creating a kconfig-package infrastructure. You're
> welcome to raise your use cases and participate to the discussion.
>

At first glance, some of the issues raised by Michal are already
implicitly covered by my patches changing uclibc:
http://patchwork.ozlabs.org/patch/371701/
http://patchwork.ozlabs.org/patch/371702/
http://patchwork.ozlabs.org/patch/371703/

The other series I sent, that introduce a kconfig-package
infrastructure, merely make the uclibc kconfig rules generic, the
behavior is defined by this first series.

Regarding the uclibc ABI argument: I may not be understanding it
completely, but if someone changes the uclibc configuration with
uclibc-menuconfig (which we support) and then types 'make', then
uclibc is rebuilt, but any real packages are not, right? So the ABI
may be broken anyway, already today.

Best regards,
Thomas
