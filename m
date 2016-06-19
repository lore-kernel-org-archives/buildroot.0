From: Ben Boeckel <mathstuf@gmail.com>
Date: Sun, 19 Jun 2016 16:43:57 +0000 (UTC)
Subject: [Buildroot] [PATCH] mpdstate: add package
References: <20160530063656.GC31737@airbook.vandijck-laurijssen.be>
 <20160612215336.06191b9e@free-electrons.com>
 <20160617083600.GA6429@airbook.newtec.eu>
 <20160617104131.0f27432f@free-electrons.com>
Message-ID: <nk6i4d$8hm$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Jun, 2016 at 08:41:31 GMT, Thomas Petazzoni wrote:
> On Fri, 17 Jun 2016 10:36:00 +0200, Kurt Van Dijck wrote:
>> I'm yet puzzled by the version info that I take from the git repository,
>> that does not work in buildroot since it's buildroot's git repo there.
>> I haven't found a solution yet, and that's keeping me from updating my
>> patches :-)
>
> Your package build system should not call "git describe" or call git to
> get the version. Or at least it should provide a way to override that.

The way to do this properly is to add to .gitattributes:

    <filespec> export-subst

and in <filespec>, any strings in the form of $Format:$ will be
expanded, the right side being a format string (see git-log(1)). I
usually do logic like:

    if ("$Format:$" == "") {
        // git archive tarball
        commit_short = "$Format:%h"
        commit = "$Format:%H"
    } else if (isdir(".git"))
        // Run "git describe"
    } else {
        commit_short = "<unknown>"
        commit = "<unknown>"
    }

--Ben
