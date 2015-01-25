From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Jan 2015 16:28:51 +0100
Subject: [Buildroot] [PATCH 1/3] python-jinja2: add python-markupsafe as
 dependency
In-Reply-To: <20150125150652.532fb6ba@free-electrons.com>
References: <1422046695-2354-1-git-send-email-erico.nunes@datacom.ind.br>	<54C431B0.4090304@mind.be>
 <20150125150652.532fb6ba@free-electrons.com>
Message-ID: <54C50BB3.6050709@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/25/15 15:06, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Sun, 25 Jan 2015 00:58:40 +0100, Arnout Vandecappelle wrote:
>> On 01/23/15 21:58, Erico Nunes wrote:
>>> BR2_PACKAGE_PYTHON_JINJA2 selects the BR2_PACKAGE_PYTHON_MARKUPSAFE
>>> option but doesn't depend on it in python-jinja2.mk.
>>>
>>> This turned in an error in an attempt to build python-jinja2 for host:
>>> "No local packages or download links found for markupsafe"
>>>
>>> Adding the python-markupsafe fixes this error and also ensures that it
>>> builds before python-jinja2 in any case.
>>
>>  I've tested it and python-jinja2 builds fine without python-markupsafe.
>>
>>  It is true that host-python-jinja2 does depend on host-python-markupsafe
>> (otherwise it will try to download it and we want to avoid that). But then you
>> should add
> 
> It is quite weird that the target and host variants don't have the same
> dependencies. Do you have an explanation about this?

 The dependency is there also for the target variant, but it's a runtime
dependency only.

 The host variant first creates an egg, and then uses the egg install procedure
to install it in the host python dir. The egg install procedure will also fetch
any dependencies, so it will fetch python-markupsafe. If you have an internet
connection, it will actually succeed to download and install python-markupsafe -
but it's really not what we want to happen.

 I guess the target variant doesn't use the normal egg install procedure because
it "knows" it can't run natively.

 Those script language package managers...

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
