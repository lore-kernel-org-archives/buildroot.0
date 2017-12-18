From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Dec 2017 16:26:02 +0100
Subject: [Buildroot] [PATCH v8 0/9] Add support for the Rust programming
 language
In-Reply-To: <20171218113122.76db1f02@windsurf>
References: <20171218075439.7d3c37c8@windsurf>
 <706201859.95242518.1513592711039.JavaMail.root@zimbra32-e6>
 <20171218113122.76db1f02@windsurf>
Message-ID: <20171218152602.GA2903@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Eric, All,

On 2017-12-18 11:31 +0100, Thomas Petazzoni spake thusly:
> On Mon, 18 Dec 2017 11:25:11 +0100 (CET), Eric Le Bihan wrote:
> > The patch which adds the package to build Rust from source provides a 
> > patch to fix a problem involving files ending with *.orig.
> > 
> > As the Rust compiler is built using Cargo, the tarball contains vendored
> > versions of the crates (e.g. src/vendor/backtrace-sys). Each crate 
> > contains a file named Cargo.toml.orig. An associated file named
> > .cargo-checksum.json will contain a checksum for Cargo.toml.orig (and
> > the other source files).
> > 
> > But support/scripts/apply-patches.sh will delete the Cargo.toml.orig 
> > files. This will cause the build to fail, as Cargo will not be able to 
> > find the file and verify the checksum.
> > 
> > So the patch included in the rust package removes all Cargo.toml.orig 
> > entries from the affected .cargo-checksum.json. As these files list all
> > the source files, this results in a huge patch.
> > 
> > Besides, as these are non-indented JSON files, some are one-lined and 
> > thus the 998 characters limit enforced by git-send-email is exceeded.
> > 
> > So, if there a way to stop support/scripts/apply-patches.sh from pruning
> > Cargo.toml.orig files, so this patch can be dropped?
> 
> Do we really have a reason to remove *.orig files in
> apply-patches.sh ? .orig backup files are only produced if -b is passed
> to patch, which we are not using.
> 
> Are there other cases where .orig files are produced by patch *and* we
> really need to remove them?
> 
> Peter, Arnout, Yann?

I have no idea about this, but the removal of .orig file has been there
since the dawn of ages, more than 15 years ago now, and the reason is
not explained.

I think we could very well live with .orig files, though.

Alternatively, we could set and export SIMPLE_BACKUP_SUFFIX=.orig.br (or
to any other singling-out value) which will force the backup suffix just
in case, and then we only remove those files.

Yet, this is adding a bit of complexity, when we could probably lives
happy with .orig files.

Except I suspect some badly-behaving packages could very well do things
like:

    data:
        call_my_tool $(wildcard #(top_srcdir)/data/*)

and thus, if we happen to patch a file in the data/ subdir, we'd break
the build of that package.

So, I would go for not removing .orig files, and in case there is one
package where this causes a problem, either we fix it, or we add a
post-patch hook to remove the .orig files, or we switch to using the
SIMPLE_BACKUP_SUFFIX variable if too many packages are impacted.

Deal? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
