From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Sep 2014 21:52:04 +0200
Subject: [Buildroot] [PATCH 02/12] binutils/2.24: add patch to warn
 about unsafe library paths
In-Reply-To: <1408540005-26934-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1408540005-26934-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1408540005-26934-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140910195204.GA23947@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-08-20 15:06 +0200, Thomas Petazzoni spake thusly:
[--SNIP--]
> +Index: b/ld/lexsup.c
> +===================================================================
> +--- a/ld/lexsup.c
> ++++ b/ld/lexsup.c
[--SNIP--]
> +@@ -519,6 +527,7 @@
> +   int ingroup = 0;
> +   char *default_dirlist = NULL;
> +   char *shortopts;
> ++  char *temp;

Well, let's give it a better name, please:  char *BR_paranoid_env;

;-)

Regards,
Yann E. MORIN.

> +   struct option *longopts;
> +   struct option *really_longopts;
> +   int last_optind;
> +@@ -1442,9 +1451,21 @@
> +               einfo (_("%P%X: --hash-size needs a numeric argument\n"));
> +           }
> +           break;
> ++
> ++   case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
> ++     command_line.poison_system_directories = FALSE;
> ++     break;
> ++
> ++   case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
> ++     command_line.error_poison_system_directories = TRUE;
> ++     break;
> + 	}
> +     }
> + 
> ++  temp = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
> ++  if (temp && strlen(temp) > 0)

    if (BR_paranoid_env && BR_paranoid_env[0])

Regards,
Yann E. MORIN.

> ++    command_line.error_poison_system_directories = TRUE;
> ++
> +   while (ingroup)
> +     {
> +       lang_leave_group ();
> +Index: b/ld/ldlex.h
> +===================================================================
> +--- a/ld/ldlex.h
> ++++ b/ld/ldlex.h
> +@@ -138,6 +138,8 @@
> +   OPTION_DEFAULT_SCRIPT,
> +   OPTION_PRINT_OUTPUT_FORMAT,
> +   OPTION_IGNORE_UNRESOLVED_SYMBOL,
> ++  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
> ++  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
> + };
> + 
> + /* The initial parser states.  */
> -- 
> 2.0.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
