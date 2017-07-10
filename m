From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jul 2017 23:36:35 +0200
Subject: [Buildroot] [PATCH 6/7] Makefile: add check that
 $(HOST_DIR)/usr is not a directory
In-Reply-To: <20170710232735.0844286e@windsurf.lan>
References: <20170709232123.30120-1-arnout@mind.be>
 <20170709232123.30120-7-arnout@mind.be>
 <20170710180240.43215e1a@windsurf.lan> <20170710161238.GA3014@scaer>
 <3a401955-07d9-054c-61a4-c91871ae1257@mind.be>
 <20170710232735.0844286e@windsurf.lan>
Message-ID: <687fe9da-0d24-0a0d-7ed7-5796073e8fb7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-07-17 23:27, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 10 Jul 2017 21:51:50 +0200, Arnout Vandecappelle wrote:
> 
>>  Actually, I realize now: when people do a git pull, we expect them to do "make
>> clean all" afterwards. And "make clean" will delete HOST_DIR - so no
>> HOST_DIR/usr will exist anymore.
>>
>>  So the original report from Thomas only happened because Thomas didn't do a
>> "make clean" like he should have...
> 
> Not correct, each time my output directory and host directories were
> empty. The only thing that was different is that the host directory is
> not set to the default of $(BASE_DIR)/host, but to /opt/something, and
> this /opt/something is created (empty) before I start the build.

 The part about a non-standard HOST_DIR is irrelevant, it's doing

make clean
mkdir -p output/host
make

that triggered the issue. Which obviously makes no sense at all in the normal
situation, but does make some kind of twisted sense in the non-standard HOST_DIR
situation.

> So my build was perfectly clean, it is just that I created the host
> directory prior to starting the build, which IMO isn't crazy,
> especially when such host directory was customized in the Buildroot
> configuration.

 Well, it doesn't make *that* much sense to me, because pre-populating that
directory with stuff is kind of fragile, given that it will all be removed again
by "make clean".

 Anyway, I still don't think that this patch is very useful :-)


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
