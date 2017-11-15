From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Nov 2017 22:24:26 +0100
Subject: [Buildroot] Suggestion to improving buildroot download infra
In-Reply-To: <5A0C4958.9040608@petroprogram.com>
References: <5A0C4958.9040608@petroprogram.com>
Message-ID: <24bacd21-4c72-c9bf-c915-57fcc4e6826d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-11-17 15:04, Stefan Fr?berg wrote:
> Hi,
> 
> Is there a way to integrate parallel wget download into buildroot?
> 
> That would greatly speed the downloading process when doing "make source"
> and maybe even later all the downloading could be done in the background, even
> when compiling some big package (for example, gentoo linux does that).
> 
> If I understand it correctly, there are at least two (if not including the crude
> & fork method)
> ways to do parallel wget:
> 
> 1. use xarg:
> 
> echo $URL_LIST | xargs -n 1 -P ${NUMBER_OF_PARALLEL_DOWNLOADS} wget
> 
> or 2. use GNU parallel
> 
> parallel -a $URL_LIST --jobs ${NUMBER_OF_PARALLEL_DOWNLOADS} wget
> 
> How exactly, does buildroot collect the download urls when doing example,
> "make source" ? Does it collect them first into some list and then do wget -i
> list ?
> Or does it just go each selected packet one-by-one and fetch the url for each?

 For each package, the <pkg>-source target is triggered. This target depends on
<pkg-build-dir>/.stamp_downloaded. If that stamp file does not exist yet, the
download is triggered.

 Since it is all done with make rules, there is no way to do things in parallel
except for doing the complete make invocation in parallel (with -j).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
