From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Tue, 7 Apr 2015 22:15:04 -0500
Subject: [Buildroot] [PATCH v2 1/2] systemd: add option to enable kdbus
	support
In-Reply-To: <20150406050422.GD2183@tarshish>
References: <1428271811-27530-1-git-send-email-ryanbarnett3@gmail.com>
 <20150406050422.GD2183@tarshish>
Message-ID: <CALq67GAML7sJTfiWamfnfXmvvsLecSMLe-3yWCK=o48yHyBekw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Mon, Apr 6, 2015 at 12:04 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Ryan,
>
> On Sun, Apr 05, 2015 at 05:10:10PM -0500, Ryan Barnett wrote:
>> In the future when the kernel offically supports kdbus, this option
>> should automatically enable the kernel kdbus config option(s).
>
> So there is no need to fiddle with kernel version dependency for
> --enable-kdbus?

To be honest, this is the first time I ever used systemd with
buildroot and I really don't know how kdbus integrates with it. The
real reason that the kdbus support is needed for miraclecast is for it
to install headers that it depends on "systemd/sd-events.h". I've
build the raspberry pi kernel and a vanilla 3.19 (QEMU x86) kernel
with systemd with the --enable-kdbus and it compiled and installed the
required headers I needed. So it appears that you can enable kdbus
without the kernel side support. There also isn't anything (that I can
find) in the systemd documentation saying that the kernel side kdbus
support is required.

If anyone can help clarify this I would appreciate since I am by no
means knowledge in this area.

>> +ifeq ($(BR2_PACKAGE_SYSTEMD_KDBUS),y)
>> +SYSTEMD_CONF_OPTS += --enable-kdbus
>> +else
>> +SYSTEMD_CONF_OPTS += --disable-kdbus
>> +endif
>
> Is there any reason not to enable kdbus when the kernel supports that? If not,
> I'd suggest to add --enable-kdbus unconditionally, and remove
> BR2_PACKAGE_SYSTEMD_KDBUS.

In the future, I would agree with this. However, as I stated above, it
appears that systemd can be compiled with kdbus support without having
the kernel side feature enabled. With kdbus in systemd being able to
enabled with the kernel kdbus support, I would be in favor of keeping
this BR2_PACKAGE_SYSTEMD_KDBUS option.

Thanks,
-Ryan
