From: Carlos Santos <casantos@datacom.com.br>
Date: Tue, 18 Dec 2018 15:19:49 -0200 (BRST)
Subject: [Buildroot] [PATCH 2/2] package/busybox: add init script for
 sysctl
In-Reply-To: <0ba00958-416a-3bac-4815-05b1d67fd02e@green-communications.fr>
References: <20181218050235.27187-1-casantos@datacom.com.br>
 <20181218050235.27187-3-casantos@datacom.com.br>
 <0ba00958-416a-3bac-4815-05b1d67fd02e@green-communications.fr>
Message-ID: <1762589626.39649690.1545153589448.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Nicolas Cavallari" <Nicolas.Cavallari@green-communications.fr>
> To: "Carlos Santos" <casantos@datacom.com.br>, "buildroot" <buildroot@buildroot.org>
> Cc: "ratbert90" <aduskett@gmail.com>, "DATACOM" <rodrigo.rebello@datacom.com.br>
> Sent: Ter?a-feira, 18 de dezembro de 2018 14:32:18
> Subject: Re: [Buildroot] [PATCH 2/2] package/busybox: add init script for sysctl

> On 18/12/2018 06:02, Carlos Santos wrote:
>> +	find $SYSCTL_SOURCES -maxdepth 1 -name '*.conf' -print0 2> /dev/null | \
>> +	xargs -0 -r readlink -f | \
>> +	{
>> +		read -r file
>> +		[ -z "$file" ] || /sbin/sysctl -q -p "$file" $SYSCTL_ARGS || return 1
>> +	}
> 
> So it will only read the first file it finds ?

The "||" operator means "do the RHS if the LHS is false", so if "$file"
is empty it doesn't run sysctl; otherwise if syscl fails (which currently
never happens due to a bug in Busybox) it returns from the function.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
