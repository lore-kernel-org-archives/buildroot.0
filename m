From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 10:17:18 +0100
Subject: [Buildroot] [PATCH] argp-standalone: fix build with > GCC5.1
In-Reply-To: <20171101205854.4e849a17@windsurf> (Thomas Petazzoni's message of
 "Wed, 1 Nov 2017 20:58:54 +0100")
References: <20171031061834.27832-1-matthew.weber@rockwellcollins.com>
 <20171101205854.4e849a17@windsurf>
Message-ID: <874lphjt5t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue, 31 Oct 2017 01:18:34 -0500, Matt Weber wrote:
 >> The problem is the change of the default C standard from gnu89 to gnu11
 >> which changes the semantics of 'inline'. The issue is described in the
 >> Porting guide at https://gcc.gnu.org/gcc-5/porting_to.html. Adding the
 >> '-fgnu89-inline' option fixes the issue.
 >> 
 >> Similar issue:
 >> https://www.mail-archive.com/ptxdist at pengutronix.de/msg09746.html
 >> 
 >> Fixes:
 >> http://autobuild.buildroot.net/results/a9c/a9cedc54829b7bd2dd7ae6ff2bd6c6db242f1c35//
 >> 
 >> Tested via test-pkg with the following cfg
 >> BR2_PACKAGE_ARGP_STANDALONE=y
 >> 
 >> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

 > So, I've applied, but with those tweaks. Indeed, your patch could
 > definitely not be fixing an issue with gcc >= 5.x, because we have been
 > using gcc 5.x for a while, and this build error was not popping up with
 > anything but gcc 7.x.

 > So, what happened is that in commit
 > a662ff7e79630ca0875dd8529fe54db27a275007, we added a patch that fixes
 > the build with C99 compilers (in fact this means gcc 5.x, which uses
 > C99 inline semantics). This changed "extern inline" to just "inline".
 > But that broke again with gcc 7.x, and causes the problem we're seeing
 > now.

 > So instead, I've dropped the chunk of the patch that changed from
 > extern inline to inline, and passsed -fgnu89-inline as you suggested. I
 > updated the commit log accordingly.

 > See
 > https://git.buildroot.org/buildroot/commit/?id=f0b65bd90ce4429d6b7e952ce7de2d5f92a2dd26
 > for more details.

Committed the revised patch to 2017.02.x and 2017.08.x, thanks both!

-- 
Bye, Peter Korsgaard
