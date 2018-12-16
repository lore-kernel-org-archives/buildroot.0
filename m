From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Dec 2018 19:57:20 +0100
Subject: [Buildroot] Alternate solution for the pkg-config mess ?
In-Reply-To: <20181216120421.48937ad1@windsurf.home>
References: <20181216120421.48937ad1@windsurf.home>
Message-ID: <20181216185720.GB2951@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-12-16 12:04 +0100, Thomas Petazzoni spake thusly:
> You'll find attached a patch that modifies pkgconf 1.5.3 to behave like
> our older pkg-config used to, i.e only prefix by the sysroot a
> specific subset of variables, and leave all others untouched.
> 
> I am clearly not familiar with all the internals of pkgconf, so I won't
> pretend that the patch is perfect, but it seems to do the job.
> 
> If we decide that this is the right approach rather than adjusting
> gazillions of packages for pkgconf 1.5.3, then let me know and I'll
> submit as a proper patch.

As discussed IRL, I prefer we have to fixup a few packages (like the
upcoming glib2 packages) rather than patch all the gazillions failing
packages we now have.

If it turns out that we have more to fix in the future with that patch,
then we can revert. But as it is now, we have too much to fix.

In my opinion, I think reverting to the previous behaviour is sane.
Since this patch is doing exactly that, then that is fine by me.

Regards,
Yann E. MORIN.

> Fabrice: I tested this with util-linux/bash-completion, and it does the
> job. If you have the chance to test it on other situations where you
> had to patch packages to work with pkgconf 1.5.3, it would be very
> useful.
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

> From bfb8780c4c12c69032c3aee6de2f7b65f72d7ae3 Mon Sep 17 00:00:00 2001
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Date: Sun, 16 Dec 2018 11:52:18 +0100
> Subject: [PATCH] Only prefix with the sysroot a subset of variables
> 
> Hack the pkg-config implementation to behave like it used to, by only
> prefixing a specific subset of variables by the sysroot.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  libpkgconf/tuple.c | 61 ++++++++++++++++++++++++++++++++--------------
>  1 file changed, 43 insertions(+), 18 deletions(-)
> 
> diff --git a/libpkgconf/tuple.c b/libpkgconf/tuple.c
> index 8523709..6fde258 100644
> --- a/libpkgconf/tuple.c
> +++ b/libpkgconf/tuple.c
> @@ -160,6 +160,18 @@ dequote(const char *value)
>  	return buf;
>  }
>  
> +static char *
> +pkgconf_tuple_parse_sysroot(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value, bool add_sysroot);
> +
> +const char *sysrooted_keys[] = {
> +	"includedir",
> +	"libdir",
> +	"mapdir",
> +	"pkgdatadir",
> +	"sdkdir",
> +	NULL,
> +};
> +
>  /*
>   * !doc
>   *
> @@ -180,6 +192,8 @@ pkgconf_tuple_add(const pkgconf_client_t *client, pkgconf_list_t *list, const ch
>  {
>  	char *dequote_value;
>  	pkgconf_tuple_t *tuple = calloc(sizeof(pkgconf_tuple_t), 1);
> +	bool add_sysroot = true;
> +	int i;
>  
>  	pkgconf_tuple_find_delete(list, key);
>  
> @@ -187,9 +201,14 @@ pkgconf_tuple_add(const pkgconf_client_t *client, pkgconf_list_t *list, const ch
>  
>  	PKGCONF_TRACE(client, "adding tuple to @%p: %s => %s (parsed? %d)", list, key, dequote_value, parse);
>  
> +	add_sysroot = false;
> +	for (i = 0; sysrooted_keys[i] != NULL; i++)
> +		if (!strcmp(key, sysrooted_keys[i]))
> +			add_sysroot = true;
> +
>  	tuple->key = strdup(key);
>  	if (parse)
> -		tuple->value = pkgconf_tuple_parse(client, list, dequote_value);
> +		tuple->value = pkgconf_tuple_parse_sysroot(client, list, dequote_value, add_sysroot);
>  	else
>  		tuple->value = strdup(dequote_value);
>  
> @@ -233,27 +252,14 @@ pkgconf_tuple_find(const pkgconf_client_t *client, pkgconf_list_t *list, const c
>  	return NULL;
>  }
>  
> -/*
> - * !doc
> - *
> - * .. c:function:: char *pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value)
> - *
> - *    Parse an expression for variable substitution.
> - *
> - *    :param pkgconf_client_t* client: The pkgconf client object to access.
> - *    :param pkgconf_list_t* list: The variable list to search for variables (along side the global variable list).
> - *    :param char* value: The ``key=value`` string to parse.
> - *    :return: the variable data with any variables substituted
> - *    :rtype: char *
> - */
> -char *
> -pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value)
> +static char *
> +pkgconf_tuple_parse_sysroot(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value, bool add_sysroot)
>  {
>  	char buf[PKGCONF_BUFSIZE];
>  	const char *ptr;
>  	char *bptr = buf;
>  
> -	if (*value == '/' && client->sysroot_dir != NULL && strncmp(value, client->sysroot_dir, strlen(client->sysroot_dir)))
> +	if (add_sysroot && *value == '/' && client->sysroot_dir != NULL && strncmp(value, client->sysroot_dir, strlen(client->sysroot_dir)))
>  		bptr += pkgconf_strlcpy(buf, client->sysroot_dir, sizeof buf);
>  
>  	for (ptr = value; *ptr != '\0' && bptr - buf < PKGCONF_BUFSIZE; ptr++)
> @@ -293,7 +299,7 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
>  
>  				if (kv != NULL)
>  				{
> -					parsekv = pkgconf_tuple_parse(client, vars, kv);
> +					parsekv = pkgconf_tuple_parse_sysroot(client, vars, kv, add_sysroot);
>  
>  					strncpy(bptr, parsekv, PKGCONF_BUFSIZE - (bptr - buf));
>  					bptr += strlen(parsekv);
> @@ -338,6 +344,25 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
>  	return strdup(buf);
>  }
>  
> +/*
> + * !doc
> + *
> + * .. c:function:: char *pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value)
> + *
> + *    Parse an expression for variable substitution.
> + *
> + *    :param pkgconf_client_t* client: The pkgconf client object to access.
> + *    :param pkgconf_list_t* list: The variable list to search for variables (along side the global variable list).
> + *    :param char* value: The ``key=value`` string to parse.
> + *    :return: the variable data with any variables substituted
> + *    :rtype: char *
> + */
> +char *
> +pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value)
> +{
> +	return pkgconf_tuple_parse_sysroot(client, vars, value, true);
> +}
> +
>  /*
>   * !doc
>   *
> -- 
> 2.19.2
> 


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
