From: Ben Boeckel <mathstuf@gmail.com>
Date: Mon, 26 Oct 2015 10:27:25 -0400
Subject: [Buildroot] [PATCH 1/1] libcap: depend on host-attr for the host
In-Reply-To: <20151026095827.2679c61f@free-electrons.com>
References: <1445722754-3477-1-git-send-email-mathstuf@gmail.com>
 <1445722754-3477-2-git-send-email-mathstuf@gmail.com>
 <20151026095827.2679c61f@free-electrons.com>
Message-ID: <20151026142725.GA13801@megas.khq.kitware.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 26, 2015 at 09:58:27 +0100, Thomas Petazzoni wrote:
> On Sat, 24 Oct 2015 17:39:14 -0400, Ben Boeckel wrote:
> > When a host-libcap is built, it is built without libattr support.
> > However, libcap does not define some symbols based on this flag. This
> > becomes a problem when a build-host tool is run (e.g., ls) which uses
> > these symbols gets the host-libcap library via LD_LIBRARY_PATH.
> 
> Ok, so let me try to understand this a bit better. You say that if you
> have host-libcap built and installed in $(HOST_DIR), then when you
> build another package, if the build process of that package uses your
> system 'ls' (i.e /bin/ls), then this ls doesn't work properly because
> it uses $(HOST_DIR)/usr/lib/libacl.so instead of /usr/lib/libacl.so.
> 
> Is that correct ?

Yes.

> If that is correct, then I think your proposed change is not the right
> solution, because it is just a workaround for the specific situation,
> on your distribution, where ls gets linked against an acl that has attr
> support. A similar problem can appear with other binaries/libraries,
> and we don't want to clutter our host package dependencies to solve
> such problems IMO.
> 
> Instead, I believe we should look at removing $(HOST_DIR)/usr/lib from
> LD_LIBRARY_PATH, i.e do something like:
<snip>

This sounds like a much better solution.

Thanks,

--Ben
