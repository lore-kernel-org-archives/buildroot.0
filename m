From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 14 Feb 2021 16:06:12 +0100
Subject: [Buildroot] [PATCH 2/2] package/tzdata: bump version to 2020f
In-Reply-To: <87zh1ekq9r.fsf@dell.be.48ers.dk>
References: <20210110164711.1708062-1-bernd.kuhls@t-online.de>
 <20210110164711.1708062-2-bernd.kuhls@t-online.de>
 <87zh1ekq9r.fsf@dell.be.48ers.dk>
Message-ID: <19dff490-6537-bc7d-7035-e4bd99f97452@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 12/01/2021 ? 18:40, Peter Korsgaard a ?crit?:
>>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:
> 
>  > Release notes:
>  > https://mm.icann.org/pipermail/tz-announce/2020-December/000064.html
> 
>  > Upstream removed timezones pacificnew and systemv:
>  > https://mm.icann.org/pipermail/tz-announce/2020-October/000059.html
> 
>  > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> Committed to 2020.02.x and 2020.11.x, thanks.
> 

This version bump seems introduce a regression in the Buildroot testsuite for
timezone tests TestGlibcAllTimezone and TestGlibcNonDefaultLimitedTimezone.

See:
https://gitlab.com/buildroot.org/buildroot/-/pipelines/253940390/failures

The Buildroot configuration was:
        BR2_TARGET_TZ_INFO=y
        BR2_TARGET_TZ_ZONELIST="northamerica"
        BR2_TARGET_LOCALTIME="America/New_York"

And the test is checking "date" output:

        tz, _ = self.emulator.run("date +%Z")
        self.assertEqual(tz[0].strip(), "EST")

        tz, _ = self.emulator.run("TZ=UTC date +%Z")
        self.assertEqual(tz[0].strip(), "UTC")

        tz, _ = self.emulator.run("TZ=America/Los_Angeles date +%Z")
        self.assertEqual(tz[0].strip(), "PST")

        tz, _ = self.emulator.run("TZ=Europe/Paris date +%Z")
        self.assertEqual(tz[0].strip(), "Europe")

This patch has been backported to stable version 2020.11.2 and 2020.02.10.
Can you have a look?

Best regards,
Romain
