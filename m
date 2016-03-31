From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 03:30:11 +0200
Subject: [Buildroot] [PATCH 1/1] buildroot-test: enable toolchains based
 on hostarch
In-Reply-To: <CAFt09wPAQQBFHUq+EMZr1S3Ap6TeJ3vKyZg6nZayRuQLPyD8fg@mail.gmail.com>
References: <1459302445-1256-1-git-send-email-matt@thewebers.ws>
 <20160330165525.4378cef8@free-electrons.com>
 <CAFt09wOZO-VodhttV3qsc5s_z0D7JzGij6ShPxYz1F0iyv-uMg@mail.gmail.com>
 <20160331030047.339bd480@free-electrons.com>
 <CAFt09wMJ7KssVQczosB9PfhX5m2Ez8HrLH9NM22QiFsUgyByxQ@mail.gmail.com>
 <CAFt09wPAQQBFHUq+EMZr1S3Ap6TeJ3vKyZg6nZayRuQLPyD8fg@mail.gmail.com>
Message-ID: <20160331033011.5c85f77f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Mar 2016 20:24:49 -0500, Matthew Weber wrote:

> Updated to account for 'any' host arch.
> 
>     # ~2015 distros report x86 when on a 32bit install
>     if hostarch == 'i686' or hostarch == 'i386' or hostarch == 'x86':
>         hostarch = 'x86'
> 
>     for row in csv.reader(l):
>         config = {}
>         config["url"] = row[0]
>         config["hostarch"] = row[1]
>         # Ignore toolchains that are not built for the appropriate
>         # host architecture
>         if hostarch != 'x86_64' and hostarch != config["hostarch"] and
> config["hostarch"] != 'any' :
>             continue
>         # Assuming x86_64 can also execute x86 toolchains
>         if hostarch == 'x86_64' and config["hostarch"] != 'x86' and
> config["hostarch"] != 'any':
>             continue
>         config["libc"] = row[2]
>         with urlopen_closing(config["url"]) as r:
>             config["contents"] = decode_byte_list(r.readlines())
>         configs.append(config)
>     return configs

Sounds good, but the conditions look complicated. What about something
like:

	keep = False

	# Keep all toolchain configs that work regardless of the host
	# architecture
	if config['hostarch'] == "any":
		keep = True

	# Keep all toolchain configs that can work on the current host
	# architecture
	if hostarch == config["hostarch"]:
		keep = True

	# Assume that x86 32 bits toolchains work on x86_64 build
	# machines
	if hostarch == 'x86_64' and config["hostarch"] == "x86":
		keep = True

	if not keep:
		continue
		
Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
