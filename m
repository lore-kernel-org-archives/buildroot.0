From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Oct 2014 15:38:18 +0200
Subject: [Buildroot] [PATCH buildroot-test 1/8] autobuild-run:
 check-requirements does not need to know the login details
In-Reply-To: <20141017222009.GQ3971@free.fr>
References: <1413486964-5183-1-git-send-email-patrickdepinguin@gmail.com>
 <20141017222009.GQ3971@free.fr>
Message-ID: <54426D4A.8050802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/10/14 00:20, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2014-10-16 21:15 +0200, Thomas De Schampheleire spake thusly:
[snip]
>> @@ -553,8 +553,9 @@ if __name__ == '__main__':
>>      check_version()
>>      sysinfo = SystemInfo()
>>      (ninstances, njobs, http_login, http_password, submitter) = config_get()
>> -    check_requirements(http_login, http_password)
>> -    if http_login is None or http_password is None:
>> +    do_send_results = http_login and http_password
> 
> I was told that we should no treat 'None' as 'False', or a non-empty
> string as 'True'. This should be something like:
> 
>     do_send_results = (not http_login is None) and (not http_password is None)

 I'm with Yann (not Maxime) on this one: if you would have an autobuild server
that doesn't need a username or password, then there would be no distinction
between sending or not sending results. with 'http_login is not None and
http_password is not None' you can set them to the empty string to force sending.

 In practice, of course, it doesn't matter because we have only one autobuild
server and it does require a non-empty username and password.


 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 
>> +    check_requirements(do_send_results)
>> +    if not do_send_results:
>>          print "WARN: due to the lack of http login/password details, results will not be submitted"
>>          print "WARN: tarballs of results will be kept locally only"
>>      def sigterm_handler(signum, frame):
>> -- 
>> 1.8.5.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
