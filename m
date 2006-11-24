From: M. Edward (Ed) Borasky <znmeb@cesmail.net>
Date: Fri, 24 Nov 2006 08:45:17 -0800
Subject: [Buildroot] problem with absolute paths to tools in ccache
In-Reply-To: <20061124105312.100310@gmx.net>
References: <20061124105312.100310@gmx.net>
Message-ID: <4567219D.6040204@cesmail.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Real.Magic at gmx.de wrote:
> Hello all!
>
> I have got a problem because ccache is using absolute paths to the ccache working directory and to the tools like gcc.
>
> To prevent ccache from using an absolute path to the ccache working directory, I have applied the following patch successfully:
>
> http://www.busybox.net/lists/buildroot/2006-October/000355.html
>
>  
> But how can I prevent ccache from using absolute paths to tools like gcc?
>
>
> Kind regards,
>
> Matthias
>
>
>   
Hmmm ... there are a bunch of environment variables that control ccache 
(from http://ccache.samba.org/ccache-man.html):

ENVIRONMENT VARIABLES

ccache uses a number of environment variables to control operation. In 
most cases you won't need any of these as the defaults will be fine.

CCACHE_DIR
    the CCACHE_DIR environment variable specifies where ccache will keep 
its cached compiler output. The default is "$HOME/.ccache".

CCACHE_TEMPDIR
    the CCACHE_TEMPDIR environment variable specifies where ccache will 
put temporary files. The default is the same as CCACHE_DIR. Note that 
the CCACHE_TEMPDIR path must be on the same filesystem as the CCACHE_DIR 
path, so that renames of files between the two directories can work.

CCACHE_LOGFILE
    If you set the CCACHE_LOGFILE environment variable then ccache will 
write some log information on cache hits and misses in that file. This 
is useful for tracking down problems.

CCACHE_PATH
    You can optionally set CCACHE_PATH to a colon separated path where 
ccache will look for the real compilers. If you don't do this then 
ccache will look for the first executable matching the compiler name in 
the normal PATH that isn't a symbolic link to ccache itself.

CCACHE_CC
    You can optionally set CCACHE_CC to force the name of the compiler 
to use. If you don't do this then ccache works it out from the command line.

CCACHE_PREFIX
    This option adds a prefix to the command line that ccache runs when 
invoking the compiler. Also see the section below on using ccache with 
distcc.

CCACHE_DISABLE
    If you set the environment variable CCACHE_DISABLE then ccache will 
just call the real compiler, bypassing the cache completely.

CCACHE_READONLY
    the CCACHE_READONLY environment variable tells ccache to attempt to 
use existing cached object files, but not to try to add anything new to 
the cache. If you are using this because your CCACHE_DIR is read-only, 
then you may find that you also need to set CCACHE_TEMPDIR as otherwise 
ccache will fail to create the temporary files.

CCACHE_CPP2
    If you set the environment variable CCACHE_CPP2 then ccache will not 
use the optimisation of avoiding the 2nd call to the pre-processor by 
compiling the pre-processed output that was used for finding the hash in 
the case of a cache miss. This is primarily a debugging option, although 
it is possible that some unusual compilers will have problems with the 
intermediate filename extensions used in this optimisation, in which 
case this option could allow ccache to be used.

CCACHE_NOSTATS
    If you set the environment variable CCACHE_NOSTATS then ccache will 
not update the statistics files on each compile.

CCACHE_NLEVELS
    The environment variable CCACHE_NLEVELS allows you to choose the 
number of levels of hash in the cache directory. The default is 2. The 
minimum is 1 and the maximum is 8.

CCACHE_HARDLINK
    If you set the environment variable CCACHE_HARDLINK then ccache will 
attempt to use hard links from the cache directory when creating the 
compiler output rather than using a file copy. Using hard links is 
faster, but can confuse programs like 'make' that rely on modification 
times.

CCACHE_RECACHE
    This forces ccache to not use any cached results, even if it finds 
them. New results are still cached, but existing cache entries are ignored.

CCACHE_UMASK
    This sets the umask for ccache and all child processes (such as the 
compiler). This is mostly useful when you wish to share your cache with 
other users. Note that this also affects the file permissions set on the 
object files created from your compilations.

CCACHE_HASHDIR
    This tells ccache to hash the current working directory when 
calculating the hash that is used to distinguish two compiles. This 
prevents a problem with the storage of the current working directory in 
the debug info of a object file, which can lead ccache to give a cached 
object file that has the working directory in the debug info set 
incorrectly. This option is off by default as the incorrect setting of 
this debug info rarely causes problems. If you strike problems with gdb 
not using the correct directory then enable this option.

CCACHE_UNIFY
    If you set the environment variable CCACHE_UNIFY then ccache will 
use the C/C++ unifier when hashing the pre-processor output if -g is not 
used in the compile. The unifier is slower than a normal hash, so 
setting this environment variable loses a little bit of speed, but it 
means that ccache can take advantage of not recompiling when the changes 
to the source code consist of reformatting only. Note that using 
CCACHE_UNIFY changes the hash, so cached compiles with CCACHE_UNIFY set 
cannot be used when CCACHE_UNIFY is not set and vice versa. The reason 
the unifier is off by default is that it can give incorrect line number 
information in compiler warning messages.

CCACHE_EXTENSION
    Normally ccache tries to automatically determine the extension to 
use for intermediate C pre-processor files based on the type of file 
being compiled. Unfortunately this sometimes doesn't work, for example 
when using the aCC compiler on HP-UX. On systems like this you can use 
the CCACHE_EXTENSION option to override the default. On HP-UX set this 
environment variable to "i" if you use the aCC compiler.

-- 
M. Edward (Ed) Borasky, FBG, AB, PTA, PGS, MS, MNLP, NST, ACMC(P)
http://borasky-research.blogspot.com/

If God had meant for carrots to be eaten cooked, He would have given rabbits fire.
