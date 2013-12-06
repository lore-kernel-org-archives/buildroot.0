From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 6 Dec 2013 13:39:28 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-12-04
In-Reply-To: <20131205073003.4AE1F101506@stock.ovh.net>
References: <20131205073003.4AE1F101506@stock.ovh.net>
Message-ID: <CAAXf6LWxqfJF7+ugT+k=Fa8ZxbRCuiVL9W_HWZZHPeoTquSGRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Dec 5, 2013 at 8:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2013-12-04
> ===============================
>
>         success : 71
>        failures : 100
>        timeouts : 2
>           TOTAL : 173
>

>     mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/798bffbb87a079ec2a1b846d53108ece46793c25/

src/cyclictest/cyclictest.c: In function 'timerthread':
src/cyclictest/cyclictest.c:638:9: error: 'union <anonymous>' has no
member named '_tid'
src/cyclictest/cyclictest.c: In function 'main':
src/cyclictest/cyclictest.c:1565:4: warning: format '%lu' expects
argument of type 'long unsigned int', but argument 2 has type
'uint64_t' [-Wformat]
make[1]: *** [cyclictest.o] Error 1

The code is:
sigev.sigev_notify_thread_id = stat->tid;
where
#define sigev_notify_thread_id _sigev_un._tid

So this _sigev_un union is supposed to contain _tid but doesn't on
this uClibc-based toolchain.
Is this a common problem when using uClibc? Any hints?

Thanks,
Thomas
