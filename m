From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 20 Jun 2015 00:38:49 +0200
Subject: [Buildroot] dependence on bash and coreutils
In-Reply-To: <55842B05.8050004@green-communications.fr>
References: <55842B05.8050004@green-communications.fr>
Message-ID: <558499F9.9000006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/19/15 16:45, Sylvain Raybaud wrote:
> Hi,
> 
> A script packaged into mariadb galera cluster and necessary for
> running a cluster require bash to be run. I was wondering if such a
> dependency should be a "select" or a "depends on". What do you think?

 select. Also add a comment # runtime dependency only

 And make sure to check that the scripts really put /bin/bash as their shebang
and not /bin/sh.

 Also, don't forget to select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS.


> Also, the same script calls "sleep" several times with non integer
> arguments. The busybox version of sleep will not take such arguments.
> There are a few options:
> 
> a) patch the script to only pass integer arguments, i.e. replace
> "sleep 0.5" with "sleep 1" and "sleep 0.2" also with "sleep 1". I
> strongly dislike this alternative.

 I tend to agree.

> 
> or
> 
> b) make mariadb depend on coreutils, which provides a version of sleep
> that takes non floating point arguments.

 That's definitely an option.

> 
> or
> 
> c) somehow patch the busybox package to make available the option to
> build sleep with support for floating point arguments and make mariadb
> depend on this option.

 You could indeed add a patch that seelcts CONFIG_FEATURE_FANCY_SLEEP and
CONFIG_FEATURE_FLOAT_SLEEP in busybox.config. I just checked, it adds 600 bytes
to the 480K of busybox in an arm thumb2 build. So for me, it's a go.

 Regards,
 Arnout

> 
> What do you think is best?
> 
> cheers,
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
>  
>  
> ************************************************************************************
> This footnote confirms that this email message has been scanned by
> PineApp Mail-SeCure for the presence of malicious code, vandals & computer viruses.
> ************************************************************************************
> 
> 
> 
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
