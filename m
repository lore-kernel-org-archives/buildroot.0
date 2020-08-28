From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 17:52:40 +0200
Subject: [Buildroot] [PATCH v3 0/3] Use aiohttp in pkg-stats
In-Reply-To: <20200808180826.1007656-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 8 Aug 2020 20:08:22 +0200")
References: <20200808180826.1007656-1-thomas.petazzoni@bootlin.com>
Message-ID: <87o8muwywn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > I started investigating why pkg-stats was sometimes stuck on the
 > server running it on a daily basis to populate
 > autobuild.buildroot.org/stats/ and send the autobuilder e-mails. The
 > subprocesses started by "multiprocessing" to retrieve the latest
 > upstream version from release-monitoring.org were stuck holding a
 > lock. Without providing a definitive conclusion, some preliminary
 > research showed that multiprocessing can be tricky and cause some
 > issues with locks.

 > Discussing this with Titouan, he suggested to use aiohttp instead of
 > multiprocessing. And indeed, it makes a lot of sense to use this
 > popular asynchronous HTTP library.

 > This patch series switches the latest version retrieval and the
 > upstream URL checking to aiohttp, and as a bonus adds some logging to
 > show the progress of the retrieval, as it can be quite long.

 > Changes since v2:

 >  - Use python3 in the shebang

 >  - Use asyncio.TimeoutError in the exception handling

 >  - Slightly rework how packages with "no valid infra" are handled in
 >    the "latest version" check, but we keep a loop to handle such
 >    packages before the main loop, as we want the real count of
 >    packages that the main loop will handle.

 >  - Use asyncio.get_event_loop() + loop.run_until_complete() instead of
 >    asyncio.run().

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
