From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Jan 2013 17:49:02 +0100
Subject: [Buildroot] [RFC v1 01/14] Add a new "src" directory in the
 output directory
In-Reply-To: <1436311.zC6hLLIaar@sagittae>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <4120429.ljLJ1sjWCA@sagittae> <20130121181640.5ea23edd@skate>
 <1436311.zC6hLLIaar@sagittae>
Message-ID: <20130122174902.3f2eca8b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue, 22 Jan 2013 11:15:11 +0100, J?r?me Pouiller wrote:

> Hmm... If source is not shared across builds, what is advantage of build out 
> of sources? 
> 
> I see two advantages:
>   - No duplication of source between host and target. But finaly, only a few 
> (and small) package are concerned. Shall we care about this?
>   - To make build of a package outside of Buildroot easier. In this case, did 
> you consider to build in a subdirectory of source? It does not allow to share 
> source between host and target but may be sufficient and may solve a bunch of 
> questions.

This last point is the main reason. For now, the LINUX_OVERRIDE_SRCDIR
mechanism is barely usable because it does a complete rsync of the
Linux source tree, which is very annoying. So, switching all packages
to out of tree build sounds like an interesting solution.

> > What happens when you bump your Buildroot version and the patches for a
> > given package change? You would have to manually clean up the source
> > directories. Not sure we want to do that, at least for now, but the
> > opinion of others would be interesting here.
> Currently, when you bump your version of Buildroot, you have to clean all. 
> Buildroot may provide a rule to also cleaning source directory. 

In my opinion, it makes the whole thing a lot more complicated to
understand. At the moment:

	make clean = removes the output directory

That's explained in just one easy line.

If we start putting the source trees outside of the output directory,
things get a lot more complicated for new users. They have to
understand there is one tree for the build results, one tree for the
sources, understand when and why to clean which of the trees and so on.
To me, it's not ok.

Remember, simplicity of use is a *key* point of Buildroot. We are very
attentive about this.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
