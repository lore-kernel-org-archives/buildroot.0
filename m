From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Oct 2017 23:56:42 +0200
Subject: [Buildroot] pre-built binary packages
In-Reply-To: <572050367.13476787.1507757774068.JavaMail.zimbra@datacom.ind.br>
References: <8AE4BE7D9622DF41B76E1AD887AA1A477BB220F1@MARCM-SBS2011.marcmltd.local>
 <20171011151137.469e7fd6@windsurf.lan>
 <572050367.13476787.1507757774068.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20171011235642.610fdc3d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Oct 2017 18:36:14 -0300 (BRT), Henrique Marks wrote:

> Here in Datacom we use "binary artifacts": when we build a package,
> we make a tarball of the artifacts. When we want to build the
> package, we try to use the tarball first, if the version (in the
> tarball) matches the package version.
> 
> We have not contributed this solution to buildroot because it doesn't
> seem to be possible to do this in a generic way. We have this binary
> artifact generation for our internal packages (and all of them use
> cmake to build). I think it is the only patch to buildroot that we
> consider to be "eternal".
> 
> You can do the same for any package: you can control what's installed
> in staging and target, and create a tarball containing these folders
> and the stamp files. Then, use this Binary, instead of the source,
> when the binary can be used (same source version, for instance).
> 
> So, a compilation in our systems always starts with a "build form
> binaries" and then "rebuild some parts from source". That's way we
> would like the python script that implements show-<pkg>-rrdepends to
> be accepted upstream: combined with binary artifacts, it is possible
> to build fast (from binaries) and rebuild fast (from source).

The problem is that you don't have any reliable way to know if your
binary artifacts are valid for a given build or not.

Let's say you have a binary artifact of Qt5. But that artifact was
created with a given set of Qt5 configuration options. If you change
any Qt5 configuration option in Buildroot, then your binary artifact
should no longer be used.

The situation becomes worse with optional dependencies. You have built
package FOO, which optionally depends on BAR, but BAR was disabled. You
create a binary artifact of FOO, and re-use it to avoid rebuilding.
Later on, you enable BAR. How do you notice that your binary artifact
of FOO is no longer correct and should be rebuilt ?

So yes, you can use binary artifact, but only if you are very, very,
very, very, very careful, and you have a full and complete
understanding of what you're doing. You can shoot yourself in the foot
very easily.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
