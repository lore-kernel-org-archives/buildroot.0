From: Joachim Wiberg <troglobit@gmail.com>
Date: Sat, 16 Jan 2021 20:33:37 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/sysklogd: bump to version
 2.1.2
In-Reply-To: <20201229181125.704233-1-andreas.hilse@googlemail.com>
References: <20200812160843.24064-1-andreas.hilse@googlemail.com>
 <20201229181125.704233-1-andreas.hilse@googlemail.com>
Message-ID: <87turgy8vi.fsf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andreas,

I noticed this hasn't been merged yet, so I thought I'd provide my
feedback.  Sorry for the delay!  Overall it looks good, and I have
a few questions, and a little reveal.

On Tue, Dec 29, 2020 at 19:11, Andreas Hilse via buildroot <buildroot@busybox.net> wrote:
> - fixes: sysklogd 1.6 klogd with newer glibcs: kernel messages are logged to user facility
> - sysklogd removed klogd, functionality has been moved to syslogd
> - now supports config fragments in /etc/syslog.d
> - disabled sysklogd logger to not interfere with other loggers
> - license has changed from GPL-2.0+ to BSD-3-Clause

These two could also be relevant:

- RFC3164 style logging, fully RFC compliant not just BSD style
- RFC5424 style logging to file and remote log servers

> +	  The continuation of the original sysklogd package, based on
> +	  the original Berkeley syslog daemon.  Now with kernel logging,
> +	  and log rotation built-in.  It ca both receive from and send
                                           ^
Minor, spelling.

> +	  to remote syslog servers.  The v2.x series include extended
> +	  support for RFC5424 with an alt. syslogp() API for clients.
[snip]
> +sha256	09fe1edca882a9ae976cdbf516786edc1629347b9507d45dc005d9d969f94702	sysklogd-2.1.2.tar.gz
> +sha256	7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477	LICENSE
> +sha256	569321607efe6ba0ecb820b3cb23d933e92f6ab50d2f8fcceb23fc8a43756ef0	0001-Define-_GNU_SOURCE_required_for_O_CLOEXEC_on_uClibc.patch

I actually released v2.2.0 the other day, and there's a SHA256 on GitHub
now.  This version comes with proper /dev/kmsg support on Linux, which
support multiple consumers, instead of the old /proc/kmsg support.  If
/dev/kmsg isn't found it falls back to the old.  It also has the build
fix for O_CLOEXEC and another fix for an ARMv5 build warning.

I've tested it with a few Bootlin toolchains in our NetBox repo, so it
should be a much smoother ride.

> +SYSKLOGD_CONF_OPTS = --exec-prefix=/ --without-logger

The logger tool that comes with sysklogd is quite advanced, allowing the
user to leverage the RFC5424 `syslogp()` API to its fullest.  However,
it collides with its namesake in BusyBox, but so does the logger tool in
util-linux.  I'd very much like to see it in Buildroot, but I can submit
a patch later to add menuconfig support :)


Best regards
 /Joachim
