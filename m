From: Carlos Santos <casantos@datacom.com.br>
Date: Tue, 18 Dec 2018 12:37:26 -0200 (BRST)
Subject: [Buildroot] [PATCH 2/2] package/busybox: add init script for
 sysctl
In-Reply-To: <CANQCQpYTmyXfgbmB_0P_+P5MreC=QPzY8RoHSzQn9SyYUsXbog@mail.gmail.com>
References: <20181218050235.27187-1-casantos@datacom.com.br>
 <20181218050235.27187-3-casantos@datacom.com.br>
 <CANQCQpYTmyXfgbmB_0P_+P5MreC=QPzY8RoHSzQn9SyYUsXbog@mail.gmail.com>
Message-ID: <1094336821.36316672.1545143846574.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Matthew Weber" <Matthew.Weber@collins.com>
> To: "Carlos Santos" <casantos@datacom.com.br>
> Cc: "buildroot" <buildroot@buildroot.org>, "ratbert90" <aduskett@gmail.com>, "DATACOM" <rodrigo.rebello@datacom.com.br>
> Sent: Ter?a-feira, 18 de dezembro de 2018 11:49:11
> Subject: Re: [Buildroot] [PATCH 2/2] package/busybox: add init script for sysctl

> Carlos,
> 
> 
> 
> On Mon, Dec 17, 2018 at 11:03 PM Carlos Santos <casantos@datacom.com.br> wrote:
>>
>> Add a simple init script that invokes sysctl early in the initialization
>> process to configure kernel parameters. This is already performed by
>> systemd (systemd-sysctl) but there is no sysvinit/busybox counterpart.
>>
>> Files are read from directories in the following list in the given order
>> from top to bottom:
>>
>>     /run/sysctl.d/*.conf
>>     /etc/sysctl.d/*.conf
>>     /usr/local/lib/sysctl.d/*.conf
>>     /usr/lib/sysctl.d/*.conf
>>     /lib/sysctl.d/*.conf
>>     /etc/sysctl.conf
>>
>> A file may be used more than once, since there can be multiple symlinks
>> to it. No attempt is made to prevent this.
>>
>> Busybox's sysctl does not support "--quiet --system" arguments like the
>> sysctl provided by procps-ng, so we resort to some scripting to mimic
>> its behavior.
>>
>> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> 
> Thanks for sending this one in.  We usually have some version of a
> script that does similar in each product rootfs overlay.

Same case here.

> I've reviewed the general function of the script is correct, I did not
> verify the SYSCTL_SOURCES are all the right plans to include.  We
> primarily just use the /etc/sysctl.conf default config and
> /etc/sysctl.d/.
> 
> Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> 
>> ---
>>  package/busybox/S01sysctl  | 63 ++++++++++++++++++++++++++++++++++++++
>>  package/busybox/busybox.mk | 12 ++++++++
>>  2 files changed, 75 insertions(+)
>>  create mode 100644 package/busybox/S01sysctl
>>
>> diff --git a/package/busybox/S01sysctl b/package/busybox/S01sysctl
>> new file mode 100644
>> index 0000000000..35e0cef291
>> --- /dev/null
>> +++ b/package/busybox/S01sysctl
>> @@ -0,0 +1,63 @@
>> +#!/bin/sh
>> +
>> +PROGRAM="sysctl"
>> +
>> +SYSCTL_ARGS=""
>> +
>> +# shellcheck source=/dev/null
>> +[ -r "/etc/default/$PROGRAM" ] && . "/etc/default/$PROGRAM"
>> +
>> +# Files are read from directories in the SYSCTL_SOURCES list, in given order.
>> +SYSCTL_SOURCES="/etc/sysctl.d/ /usr/local/lib/sysctl.d/ /usr/lib/sysctl.d/
>> /lib/sysctl.d/ /etc/sysctl.conf"
>> +
>> +# A file may be used more than once, since there can be multiple symlinks to
>> +# it. No attempt is made to prevent this.
>> +#
>> +# Busybox's sysctl does not support "--quiet --system" arguments like the
>> +# sysctl provided by procps-ng, so we resort to some scripting to mimic its
>> +# behavior.
>> +#
>> +# The "return 1" below is fruitless, at the moment, since sysctl ends with
>> +# status zero even if errors happen. Hopefully this will be fixed in a future
>> +# version of Busybox.
>> +apply_configs() {
>> +       # shellcheck disable=SC2086 # we need the word splitting
>> +       find $SYSCTL_SOURCES -maxdepth 1 -name '*.conf' -print0 2> /dev/null | \
> 
> Why restrict to .conf?

That's what procps-ng's sysctl does and I wanted to mimic it as
faithfully as possible. It also prevents attempting to use some README
file.

[...]

-- 
Carlos Santos (Casantos) - DATACOM, P&D
