From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Jul 2017 23:46:59 +0200
Subject: [Buildroot] [PATCH] python-toml: add host variant of the package
In-Reply-To: <20170725214647.51f5a3b0@windsurf.home>
References: <20170725045132.363-1-andrew.smirnov@gmail.com>
 <20170725214647.51f5a3b0@windsurf.home>
Message-ID: <c6b0876d-b5af-a2d8-a70f-6971c1680bce@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-07-17 21:46, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 24 Jul 2017 21:51:32 -0700, Andrey Smirnov wrote:
>> Add host variant of the package to make it availible to custom host
>> tools that might want to use it.
>>
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> 
> Since we still don't have Config.in options for all host packages, I
> continue to be reluctant to add such patches, because host packages
> like this are never tested by the autobuilders: there are no target
> packages that use them.

 We decided in the BR meeting after FOSDEM this year that host-packages would
only be added if there is either an in-tree user or a user-selectable
Config.in.host entry. And that we would be a little more receptive to packages
with a Config.in.host entry.

 However, these python packages are a bit a special situation. I think usually
it would be OK to expect such packages to be present on the system if they are
used by custom host tools. However, when you install python on the target,
host-python will be built and any system-installed packages will no longer be
used. And I guess that this is the reason why you need this package, right, Andrey?

 We recently had this patch that adds host-python as a dependency to libglib2
that runs in the same vein: libglib2 will run a python that it finds in PATH,
which sometimes is system-python, sometimes host-python...

 So I think we should consider looking for a more fundamental solution. For
example, install host-python{,3} somewhere else than in HOST_DIR/bin, and in the
packages that really need it extend PATH=$HOST_PYTHON_DIR:$PATH. That could
potentially solve a lot of issues...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
