From: Jan Pohanka <xhpohanka@gmail.com>
Date: Fri, 10 Aug 2012 12:57:57 +0200
Subject: [Buildroot] libev on armv5 - illegal instruction
In-Reply-To: <op.witdwcuqyxxkfz@pohanka-pc>
References: <op.wirpbfhyyxxkfz@pohanka-pc> <20120810085836.3c62fe7e@skate>
 <op.witdwcuqyxxkfz@pohanka-pc>
Message-ID: <op.witnevwzyxxkfz@pohanka-pc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> working host (Ubuntu 11.10) uname -a
> Linux linux-dev 3.0.0-23-server #39-Ubuntu SMP Thu Jul 19 19:37:41 UTC
> 2012 x86_64 x86_64 x86_64 GNU/Linux
>
> my workstation (Ubuntu 12.04 lts) uname -a
> Linux pohanka-pc 3.2.0-27-generic #43-Ubuntu SMP Fri Jul 6 14:25:57 UTC
> 2012 x86_64 x86_64 x86_64 GNU/Linux
>
> It is really weird. I cannot imagine how buildroot using the same
> crosscompiler can produce different binaries on different PCs...
>

I have checked it once more with fresh git clones of BR and cross  
toolchain reinstalled.
config.log in output/build/libev-4.11 are the same on both machines as  
well as generated Makefiles (except of absolute paths to buildroot  
directory).

However the compiled binaries on both hosts are different. I have never  
seen that before.

The problem is in the function

ev_tstamp ev_time (void)
{
   struct timeval tv;
   gettimeofday (&tv, 0);
   return tv.tv_sec + tv.tv_usec * 1e-6;
}

where the computation uses vldr instruction. I was not succesful to  
simulate outside of libev...

regards
Jan

-- 
Tato zpr?va byla vytvo?ena p?evratn?m po?tovn?m klientem Opery:  
http://www.opera.com/mail/
