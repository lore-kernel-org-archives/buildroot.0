From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Nov 2016 23:41:33 +0100
Subject: [Buildroot] 2016.11-rc2 with really old versions of bash (RHEL5)
In-Reply-To: <20161116231312.GA27675@free.fr>
References: <20161113210740.3a8cedb2@free-electrons.com>
 <582ce22d87e4_b6b11ecfac31990@ultri3.mail> <20161116231312.GA27675@free.fr>
Message-ID: <7725a865-0665-5747-6bfb-518224e3825b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-11-16 00:13, Yann E. MORIN wrote:
> Ricardo, All,
> 
> On 2016-11-16 20:48 -0200, Ricardo Martincoski spake thusly:
>> Do you see the issue described below? Maybe I am doing something wrong.
>> What bash version do you have in your RHEL5 servers?
>>
>> All,
>>
>> Ancient versions of bash don't support 'Associative arrays', leading to build
>> error using 2016.11-rc2 in a plain vanilla RHEL5.
> 
> Asociative arrays were introduced in bash-4.0, indeed.
> 
> Doing without associative arrays is not very easy. Rather, it would be
> very difficult.

 The associative arrays can be overcome relatively easily with eval; the indexed
array BR2_EXT_NAMES would be trickier to remove. This is possible because we
require the names to be only [A-Za-z0-9_] so they can be used as variable names.

 The idea is to do:

-    BR2_EXT_PATHS["${br2_name}"]="${br2_ext}"
+    eval BR2_EXT_PATH_${br2_name}='"${br2_ext}"'

and

-        printf ' %s' "${BR2_EXT_PATHS["${br2_name}"]}"
+        eval "printf ' %s' \"\${BR2_EXT_PATH_${br2_name}}\""

 It's horribly ugly, but it does work. Well, at least I think so :-)


 Regards,
 Arnout

> 
> Unless the script is re-written in an other language...
> 
>> Please notice EOL of RHEL5 is 31 Mar 2017 [1].
> 
> Well, it's not even 6 months in the future. Time to upgrade, maybe? ;-)
> 
>> Currently the manual does not specify a minimum version of bash [2].
> 
> I think the best short-term solution is that we advertise that bash 4.0
> is required, now.
> 
> Let's see what others think...
> 
> Regards,
> Yann E. MORIN.
> 
> 
>> This is NOT my use case!
>> I was just testing some unrelated stuff in a VM and came across it.
>> I didn't tested the obvious workaround (installing a newer bash) but it should
>> work.
>>
>> See below the logs for RHEL5 (error) and RHEL6 (ok).
>>
>> [ricardo at centos5 buildroot-2016.11-rc2]$ grep release /etc/issue        
>> CentOS release 5.11 (Final)
>> [ricardo at centos5 buildroot-2016.11-rc2]$ bash --version | grep bash
>> GNU bash, version 3.2.25(1)-release (x86_64-redhat-linux-gnu)
>> [ricardo at centos5 buildroot-2016.11-rc2]$ make -s defconfig
>> support/scripts/br2-external: line 6: declare: -A: invalid option
>> declare: usage: declare [-afFirtx] [-p] [name[=value] ...]
>> Makefile:188: /home/ricardo/buildroot-2016.11-rc2/output/.br-external.mk: No such file or directory
>> make[1]: Failed to remake makefile `/home/ricardo/buildroot-2016.11-rc2/output/.br-external.mk'.
>> support/scripts/br2-external: line 6: declare: -A: invalid option
>> declare: usage: declare [-afFirtx] [-p] [name[=value] ...]
>> make[1]: *** [/home/ricardo/buildroot-2016.11-rc2/output/build/.br2-external.in] Error 2
>> make: *** [_all] Error 2
>>
>> [ricardo at centos6 buildroot-2016.11-rc2]$ grep release /etc/issue        
>> CentOS release 6.8 (Final)
>> [ricardo at centos6 buildroot-2016.11-rc2]$ bash --version | grep bash
>> GNU bash, version 4.1.2(1)-release (x86_64-redhat-linux-gnu)
>> [ricardo at centos6 buildroot-2016.11-rc2]$ make -s defconfig
>> #
>> # configuration written to /home/ricardo/buildroot-2016.11-rc2/.config
>> #
>>
>> [1] https://wiki.centos.org/Download
>> [2] http://nightly.buildroot.org/manual.html#requirement-mandatory
>>
>> Regards,
>> Ricardo
> 
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
