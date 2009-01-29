From: Javier Viguera <javier.viguera@digi.com>
Date: Thu, 29 Jan 2009 20:54:37 +0100
Subject: [Buildroot] [buildroot 0001090]: stdlibc++ fails putting a
	double in a stream.
In-Reply-To: <9390a75d187845256e22e9a1e085fdbb@busybox.net>
References: <9390a75d187845256e22e9a1e085fdbb@busybox.net>
Message-ID: <glt1hu$rk9$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I have hit this old bug with a toolchain for ARM based on gcc-4.0.3 and 
uclibc-0.9.28. The issue is described below and in the thread of the bug 
there seems to be a couple of patches that fixes the problem:

 > gcc_snprintf_double_cssize.patch
 > c_locale.h

I am trying to get those patches, but the bug-tracking system seems not 
to have bug #1090. I seem to remember some changes in the buildroot 
servers lately, so that might be the reason why i cannot reach older bugs.

Does anyone here still have those patches?

Someone with access to the old bug's database that can take those 
patches and send them to the list or to my e-mail (below)?

Thanks in advance.

-- 
Regards,

Javier Viguera
Software Engineer

Digi International Spain, S.A.
C/ Milicias 13, Bajo
26003 Logro?o (La Rioja)
Spain
Phone: +34 941 270 060
Fax:   +34 941 237 770
mailto:javier.viguera at digi.com
http://www.digi.com

bugs at busybox.net wrote:
> A NOTE has been added to this issue. 
> ====================================================================== 
> http://busybox.net/bugs/view.php?id=1090 
> ====================================================================== 
> Reported By:                GJanak
> Assigned To:                buildroot
> ====================================================================== 
> Project:                    buildroot
> Issue ID:                   1090
> Category:                   Architecture Specific
> Reproducibility:            always
> Severity:                   major
> Priority:                   normal
> Status:                     assigned
> ====================================================================== 
> Date Submitted:             11-14-2006 00:01 PST
> Last Modified:              08-25-2008 05:31 PDT
> ====================================================================== 
> Summary:                    stdlibc++ fails putting a double in a stream.
> Description: 
> The problem was:
> putting a double in a stream:
> cout << 10.5 ;
> 
> Produce an empty string, or some garbage characters.
> 
> I could resolve the error down to some wired Code combination between
> uclibc and libstdc++
> ====================================================================== 
> 
> ---------------------------------------------------------------------- 
>  GJanak - 02-12-07 05:50  
> ---------------------------------------------------------------------- 
> I don't think it's an buildroot Problem.
> 
> Its an uclibc c++ error... 
> 
> ---------------------------------------------------------------------- 
>  GJanak - 08-27-07 05:02  
> ---------------------------------------------------------------------- 
> New info.
> 
> The Problem is: very old files are patched into current gcc releases.
> I mean the toolchain/gcc/4.2.1/200-uclibc-locale.patch
> which creates 
> gcc/libstdc++-v3/config/locale/uclibc/c_locale.cc
> 
> The file created by the patch is based on the generic Config and than
> patched for uclibc. But the generic is changed with 4.x.x.
> 
> Best solution would be to copy the gcc/libstdc++-v3/config/locale/generic
> Dir and than add a patch on this Dir.
> 
> The Differences needed would be smaller. And perhaps the Patch would work
> for multiple gcc versions. 
> 
> ---------------------------------------------------------------------- 
>  GJanak - 08-27-07 05:03  
> ---------------------------------------------------------------------- 
> The Patch gcc_snprintf_double_cssize.patch is a workaround, hacking the
> change in gcc. But it isnt a good solution. 
> 
> ---------------------------------------------------------------------- 
>  ncoesel - 08-25-08 05:31  
> ---------------------------------------------------------------------- 
> I've been bitten by this as well. IMHO the proper solution is to mimic
> non-C99 behaviour so convert_from_v should use sprintf instead of snprintf
> when the size is 0. I attached the modified c_locale.h file. 
> 
> Issue History 
> Date Modified   Username       Field                    Change               
> ====================================================================== 
> 11-14-06 00:01  GJanak         New Issue                                    
> 11-14-06 00:01  GJanak         Status                   new => assigned     
> 11-14-06 00:01  GJanak         Assigned To               => uClibc          
> 11-14-06 00:05  GJanak         Issue Monitored: GJanak                      
> 02-12-07 05:34  vapier         Assigned To              uClibc => buildroot 
> 02-12-07 05:50  GJanak         Note Added: 0002152                          
> 08-27-07 05:02  GJanak         Note Added: 0002698                          
> 08-27-07 05:02  GJanak         File Added: gcc_snprintf_double_cssize.patch     
>               
> 08-27-07 05:03  GJanak         Note Added: 0002699                          
> 08-25-08 05:31  ncoesel        Note Added: 0010764                          
> ======================================================================
