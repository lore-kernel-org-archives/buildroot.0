From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Jan 2020 18:27:16 +0100
Subject: [Buildroot] [PATCH v2 1/5] utils/scancpan: warn when a module
 is a perl core module
In-Reply-To: <20200108151041.12757-1-francois.perrad@gadz.org>
References: <20200108151041.12757-1-francois.perrad@gadz.org>
Message-ID: <20200108172716.GC17943@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2020-01-08 16:10 +0100, Francois Perrad spake thusly:
> we don't want create new BR package with perl core module,
> because core modules are already included in perl distribution,
> and built with the BR package perl.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Serries applied to master, thanks.

However, I was a bit disapointed that a series sent just a few hours ago
did not apply cleanly on master: I had to rework all the patches because
they were conflicting with changes in Config.in.legacy that have been
there since ctober.

So I don't know what your series was based off, but next time, please
rebase it before sending, so there is no conflict...

Regards,
Yann E. MORIN.

> ---
>  utils/scancpan | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/utils/scancpan b/utils/scancpan
> index ac5fd5159..dbd8dab6d 100755
> --- a/utils/scancpan
> +++ b/utils/scancpan
> @@ -611,6 +611,9 @@ sub fetch {
>      unless ($dist{$name} && !$top) {
>          say qq{fetch ${name}} unless $quiet;
>          my $result = $mcpan->release( distribution => $name );
> +        my $main_module = $result->{main_module};
> +        push @info, qq{[$name] $main_module is a core module}
> +            if $top && Module::CoreList::is_core( $main_module, undef, $] );
>          $dist{$name} = $result;
>          $license_files{$name} = {};
>          eval {
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
