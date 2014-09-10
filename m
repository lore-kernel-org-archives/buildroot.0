From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Sep 2014 22:24:00 +0200
Subject: [Buildroot] [PATCH 06/12] gcc/4.9: add patch to warn about
 unsafe header paths
In-Reply-To: <20140910200825.GB23947@free.fr>
References: <1408540005-26934-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1408540005-26934-7-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140910200825.GB23947@free.fr>
Message-ID: <20140910222400.5850961c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 10 Sep 2014 22:08:25 +0200, Yann E. MORIN wrote:

> > ++  temp = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
> > ++  if (temp && strlen(temp) > 0)
> > ++    {
> > ++      save_switch("-Werror=poison-system-directories", 0, NULL, false, true);
> 
> Here you set the --error-poison-system-direcotries for the linker...

No, that's not what's happening here. What's happening here is that if
BR_COMPILER_PARANOID_UNSAFE_PATH is set and non-empty, then we add
-Werror=poison-system-directories to the gcc options. This makes gcc
behave as if -Werror=poison-system-directories was passed on the
command line.

The idea is that it's hard for Buildroot to guarantee that
-Werror=poison-system-directories in the CFLAGS will *always* be passed
by all packages to the build of all files. So having an environment
variable that forces gcc to add this option by itself makes sure all
files will be compiled with this behavior.


> > ++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
> > ++  if (flag_poison_system_directories)
> > ++    {
> > ++       struct cpp_dir *p;
> > ++
> > ++       for (p = heads[QUOTE]; p; p = p->next)
> > ++         {
> > ++          if ((!strncmp (p->name, "/usr/include", 12))
> > ++              || (!strncmp (p->name, "/usr/local/include", 18))
> > ++              || (!strncmp (p->name, "/usr/X11R6/include", 18)))
> > ++            warning (OPT_Wpoison_system_directories,
> > ++                     "include location \"%s\" is unsafe for "
> > ++                     "cross-compilation",
> > ++                     p->name);
> 
> But you do not handle include paths.

What? We're precisely handling include paths here.

> We should error out if BR_COMPILER_PARANOID_UNSAFE_PATH is set and
> non-empty, no?

See above, that's exactly what is happening. By default
(BR_COMPILER_PARANOID_UNSAFE_PATH is unset or empty), only warnings are
generated. If BR_COMPILER_PARANOID_UNSAFE_PATH is set and non-empty,
then it will be an error.

You should probably test this, and you'll notice that the warning()
function above actually *errors* out if the OPT_W<foo> warning passed
as first argument has -Werror=<foo> in the command line.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
