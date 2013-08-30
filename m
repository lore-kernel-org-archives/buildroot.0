From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Aug 2013 09:58:31 +0200
Subject: [Buildroot] feature or pebkac
In-Reply-To: <521F9B91.7040903@mind.be>
References: <20130829111708.c603e5bf976541d3abd3a43a@lavabit.com>
 <521F9B91.7040903@mind.be>
Message-ID: <20130830095831.12c3c743@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 29 Aug 2013 21:05:53 +0200, Arnout Vandecappelle wrote:
> On 08/29/13 20:17, rh wrote:
> > I have found that changing the url for a custom kernel tar ball does not
> > trigger a rebuild when running make.  I have removed linux-custom dir
> > and then make fetches the new tar ball and rebuilds.
> 
>   That's right. Buildroot doesn't try to be perfect for rebuilds when the 
> configuration changes - but if it is simple to fix, patches are welcome!

As Thomas De Schampheleire later explained, the problem is that for
custom tarballs, we can't easily find a directory name that's unique
for each tarball, except by having a name that is a complete
translation of the tarball URL, such as:

output/build/linux-http-www.company.com-pub-linux-3.10-board-foo.tar.gz/

That's more or less what Thomas DS proposed, and I wasn't too happy
with it due to the horrible directory name. Another option would be to
hash the tarball location and do:

output/build/linux-${hash}/

but then it's difficult for the user to map which linux-<foo> directory
corresponds to which version he has built.

> > But I don't need all that and I now use --single-branch argument
> > to git clone followed by git archive to create a tar ball.
> 
>   That's a great idea! However, this option is only available since git 
> 1.7.10 and I think that many production environments still have older git 
> versions.

Can't we do like what we do for shallow clones? Try if --single-branch
is supported and works, and if so, all right, if not, fall back to the
normal way?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
