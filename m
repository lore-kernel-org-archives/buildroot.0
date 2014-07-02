From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Jul 2014 19:22:43 +0200
Subject: [Buildroot] [PATCH 03/14] pkg-infra: move the git download
 helper to a script
In-Reply-To: <CAAXf6LVZrM5ZUkAxvGPRuupq3f6_jWU+V6e=0-11UVd9XA1GKQ@mail.gmail.com>
References: <cover.1404167061.git.yann.morin.1998@free.fr>
 <c270e9e49dbc69c08629893f7c5e8fa952e37da7.1404167061.git.yann.morin.1998@free.fr>
 <87fvijbx17.fsf@dell.be.48ers.dk>
 <20140702174430.3f1377ce@free-electrons.com>
 <CAAXf6LVZrM5ZUkAxvGPRuupq3f6_jWU+V6e=0-11UVd9XA1GKQ@mail.gmail.com>
Message-ID: <20140702192243.20920b70@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 2 Jul 2014 19:19:42 +0200, Thomas De Schampheleire wrote:

> >> Thanks. I've verified that the (non-gzip'ed) tarball is identical to
> >> what we had before, but I noticed that we no longer delete the temporary
> >> repo in DL_DIR.
> >>
> >> Did you do that change on purpose? I don't think we want to keep it, do
> >> we?
> >
> >Hum, I'm confused, didn't we say that we should no longer do any
> >temporary thing in $(DL_DIR) in order to allow parallel builds of
> >separate Buildroot instances to not mess up with each other? I think we
> >said that the process should be:
> >
> > 1/ Clone the repo in $(BUILD_DIR)
> > 2/ Create the tarball of the repo in $(BUILD_DIR)
> > 3/ Move the tarball from $(BUILD_DIR) to $(DL_DIR) with a temporary
> >    unique file name.
> > 4/ Rename the tarball in $(DL_DIR) to its final name
> >
> >Steps (3) and (4) are separated so that if $(DL_DIR) and $(BUILD_DIR)
> >are in separate filesystems, the rename to the final name remains an
> >atomic operation.
> >
> >And yes, the git download helper from Yann doesn't seem to implement
> >this logic (or I got lost with the variable names, which is very
> >possible).
> 
> This patch (3/14) only moves the existing logic to a separate script,
> just like for the other helpers. Later patches in the same series
> improve the logic. In particular, not using DL_DIR as scratchpad is
> implemented in patch 11/14 http://patchwork.ozlabs.org/patch/365791/

Ah, ok, thanks for the clarification. However that doesn't explain why
the temporary repo in $(DL_DIR) is not being removed. That's a
regression compared to the original code in the .mk file, no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
