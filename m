From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 15 Jun 2014 12:36:44 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140615122040.6effbc93@free-electrons.com>
References: <20140615063014.70ACF100EAC@stock.ovh.net>
 <20140615122040.6effbc93@free-electrons.com>
Message-ID: <01b1dd01-35b7-40d8-bb70-56a33e20f1a6@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> schreef:
>Hello all,
>
>Over the next few days, I'll try to do a quick analysis of the build
>failures, to let you know which build failures are "real", and which
>build failures are caused by issues in the autobuilder infrastructure.
>
>On Sun, 15 Jun 2014 08:30:14 +0200 (CEST), Thomas Petazzoni wrote:
>
>>    powerpc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/b62615a2d933f2b69c8b402d0134c72675a7e527/
>
>Still the libstdc++ static linking issue.
>
>>       i686 |                  cairo-1.12.10 | TIM | http://autobuild.buildroot.net/results/211fbc0aee997139a7a9d65b4776e02a5b294b4e/
>
>Timeout on my private server. It seems like this server is by an order
>of magnitude slower than the Free Electrons build server, and that
>therefore the timeout  of 4 hours is not appropriate for builds that
>can have up to 30% of the packages enabled. For example, this private
>server needs 20 minutes to build libglib2 (which seems very long, not
>sure what's going on there).
>
>I'm looking for suggestions on this, because I'm sure other people
>testing the autobuild-run script will have similar problems, as they
>will not all have 8 cores monsters with 32 GB of RAM and fast I/O.
>There are two possible directions:
>
> * Make the timeout configurable, so that people can adjust it to their
>   configuration to avoid false positives as much as possible.
>
> * Make the timeout a per-package timeout. However, that requires
>   having a process running in parallel to the build to monitor the
>   progress of the build. Not impossible, but requires a bit of
>   additional logic in autobuild-run.
>
> * Make the KCONFIG_PROBABILITY configurable. My statistics lessons are
>   way too much in the past, but I'm wondering if having different
>   KCONFIG_PROBABILITY in the various builders is not going to make the
>   statistic of failed vs. success builds a bit meaningless. If one
>   machine runs with a low KCONFIG_PROBABILITY, this machine will do a
>   lot of small builds, and small builds have a much higher chance of
>   being successful than bigger builds. Therefore, such a machine could
>   easily reach a very high success rate of builds, compared to a
>   machine running with a higher KCONFIG_PROBABILITY value. Thoughts on
>   this? Or people better in statistics than me to confirm or infirm my
>   reasoning?
>

Could you clarify why we need a timeout in the first place? Have there been occurrences of builds that get stuck (in a loop or otherwise)?
According to me, it doesn't matter that a build takes ten hours for a given configuration, as long as it progresses and doesn't get stuck...

Best regards,
Thomas
