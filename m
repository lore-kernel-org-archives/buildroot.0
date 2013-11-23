From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Nov 2013 00:07:53 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131122131331.70220520@skate>
References: <20131122073003.1B835101305@stock.ovh.net>
 <20131122091411.59d82eb5@skate> <201311221358.29661.fatih.asici@gmail.com>
 <20131122131331.70220520@skate>
Message-ID: <52913549.8080500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/11/13 13:13, Thomas Petazzoni wrote:
> Dear Fatih A??c?,
>
> On Fri, 22 Nov 2013 13:58:29 +0200, Fatih A??c? wrote:
>> On Friday 22 November 2013 10:14:11 Thomas Petazzoni wrote:
>>>>         arm |           qt5declarative-5.1.1 | NOK |
>>>> http://autobuild.buildroot.net/results/82bb89d5b29dc6bd40f840bc04845b6c87
>>>> 157985/
>>>
>>> Weird thing. It's having problems when building things for the host...
>>> but it uses target headers when building for the host. Someone needs to
>>> look closely into this. Fatih ? :-)
>>
>> All those headers belong to Qt. Qt does not install headers into host prefix.
>> This might be intentional. It doesn't sound like a problem to me.
>
> It does to me. Headers correspond to libraries. And therefore, headers
> installed in $(STAGING_DIR) match libraries installed in
> $(STAGING_DIR), and so built for the target. Including headers from
> $(STAGING_DIR) to build native tools seems wrong.

  And just to prove that point: when the staging dir is removed from the 
include path, that file compiles fine. That is, after symlinking the 
QtCore directory to somewhere else in the include path, otherwise the Qt 
includes can't be found. Another solution is to replace the -I with 
-idirafter, so the system includes come first.

  The reason that the staging dir has to be included is because that's 
the only place where you can find the core Qt libraries.

  The funny thing is that Qt is smart enough to link with the libraries 
in host/usr/lib and install the executables in host/usr/bin...


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
