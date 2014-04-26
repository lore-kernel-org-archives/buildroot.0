From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Apr 2014 11:47:01 +0200
Subject: [Buildroot] [PATCH v2 1/1] zeromq: don't use fork() on noMMU
 platforms
In-Reply-To: <1398492531-2946-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1398492531-2946-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20140426114701.23e40741@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

On Sat, 26 Apr 2014 08:08:51 +0200, Jerzy Grzegorek wrote:

> +-    int pid = fork ();
> ++#ifdef HAVE_FORK
> ++    int pid = fork();
> ++#else
> ++    int pid = vfork();
> ++#endif

Are you sure the child immediately does an exec() ? vfork() is not
equivalent to fork(), so one cannot be blindly replaced by the other.
Since the whole test is dedicated to testing fork, I think it doesn't
make sense to build it. So, your previous patch was better, it is just
that your previous patch was completely removing the build of
test_fork, while it should be conditional on whether the platform
implements fork() or not.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
