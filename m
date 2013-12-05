From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 05 Dec 2013 16:14:46 +0100
Subject: [Buildroot] [PATCH v3] package/tvheadend: unbreak
In-Reply-To: <1386115721-24113-1-git-send-email-yann.morin.1998@free.fr>
References: <1386115721-24113-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <52A09866.9080800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/12/13 01:08, Yann E. MORIN wrote:
> +	 --cc="$(TARGET_CC)"			\
> +	 --cflags="$(TARGET_CFLAGS)"		\

  It looks like the configure script is broken and fails if these 
variables contain spaces (like e.g. when ccache is used).

 From support/configure.inc:

function parse_args
{
   local opt= val=
   for opt do
     val=${opt#*=}
     opt=${opt%=*}
     opt=${opt#*--}
     case "$opt" in
       cc|cflags|arch|cpu|platform|python)
         eval "`toupper $opt`=$val"
         ;;

  Since the $val isn't quoted, a value with spaces will expand to e.g.:

eval "CC=ccache gcc"

which will execute

CC=ccache gcc

so it will try to run gcc...

  In addition, parse_args is called from configure as:

parse_args $*

which will expand to:

parse_args --cc=ccache gcc --cflags=-DFOO -DBAR

so we only get the ccache and -DFOO in CC and CFLAGS. The unknown 
arguments gcc and -DBAR are ignored.

  Two options:

- fix the scripts;

- don't use --cc and --cflags but just pass them in the environment 
(assuming that this works).

  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
