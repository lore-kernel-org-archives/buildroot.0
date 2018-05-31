From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 May 2018 22:18:22 +0200
Subject: [Buildroot] Buildroot 2018.05-rc3 released
In-Reply-To: <1527791404.2065.8.camel@rovoreed.com>
References: <87efhvufjm.fsf@dell.be.48ers.dk>
 <1527599917.2053.2.camel@rovoreed.com> <87fu2a7bkq.fsf@dell.be.48ers.dk>
 <1527615682.2053.4.camel@rovoreed.com> <87po1e5mev.fsf@dell.be.48ers.dk>
 <1527674917.2072.2.camel@rovoreed.com> <87tvqp2lqv.fsf@dell.be.48ers.dk>
 <20180530180026.77e1dfac@windsurf.home> <87efht2k8o.fsf@dell.be.48ers.dk>
 <1527778369.2065.4.camel@rovoreed.com> <20180531172600.3cc0568e@windsurf>
 <1527791404.2065.8.camel@rovoreed.com>
Message-ID: <ab40f635-f541-ab68-77c9-1a8dc7f749d0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31-05-18 20:30, Mike Davies wrote:
> On Thu, 2018-05-31 at 17:26 +0200, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Thu, 31 May 2018 15:52:49 +0100, Mike Davies wrote:
[snip]
>>> I do not know the implications of simply moving --enable-
>>> unicode=ucs4
>>> to the list of HOST_PYTHON_CONF_OPTS at the start of python.mk.
>>
>> But why would UCS4 support be required for you to build ca-
>> certificates
>> and not on other systems ?
>>
>> My test build had BR2_PACKAGE_PYTHON_UCS4 disabled, so
>> --enable-unicode=ucs4 was also not passed when building host-python.
>>
> 
> Why it builds OK for others and not me, then, sorry, I don't know.
> 
> When I build ca-certificates I saw that host-python was complaining
> about undefined symbol: PyUnicodeUCS2_AsEncodedString, so I fiddled
> about with the parameters to the host python configure script, noted
> that if I force the host python configure with --enable-unicode=ucs4
> then it works. If I change that to --enable-unicode=ucs2 or --enable-
> unicode then it fails the same.
> 
> I'm not a Python programmer. This PC does not have Python on it at all,

 I doubt that: the dependencies.sh script checks that there is a "python"
executable in PATH, and the check-uniq-files script that is called at the end of
the build is also a Python script.

> and it only gets dragged in by buildroot to build ca-certificates.
> Maybe that is something to do with it.
> 
> Let's not waste any more time on it.

 Well, this may happen to other people as well, so it would be good to get to
the bottom of it.

 Let's see if we can find where the problem is. Can you do

readelf -d output/host/bin/python

readelf -W -s output/host/lib/libpython2.7.so | \
  grep PyUnicodeUCS._AsEncodedString

readelf -W -s output/build/host-python-2.7.14/Objects/unicodeobject.o | \
  grep PyUnicodeUCS._AsEncodedString



 Regards,
 Arnout

> 
> Mike
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
