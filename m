Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA383C38142
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 07:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B4AB4055E;
	Mon, 23 Jan 2023 07:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B4AB4055E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id biWRSAN_15A0; Mon, 23 Jan 2023 07:20:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 670EE4046B;
	Mon, 23 Jan 2023 07:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 670EE4046B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11E8A1BF36E
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 07:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E092E415E4
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 07:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E092E415E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FlJ1cTCFlWSP for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 07:20:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 432AF415E1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 432AF415E1
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 07:20:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CF1235FF93;
 Mon, 23 Jan 2023 08:20:13 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 23 Jan 2023 08:20:13 +0100
Date: Mon, 23 Jan 2023 08:20:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Steve Hay <me@stevenhay.com>
Message-ID: <20230123072013.GC2632@scaer>
References: <20230122234309.2111129-1-me@stevenhay.com>
 <20230122234309.2111129-2-me@stevenhay.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230122234309.2111129-2-me@stevenhay.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1674458416;
 bh=GJ8jzBbRYc0AHn6OaA4ChNNKuwhumRshdWOpWj7qmbw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WTiQtgXmCrDy+qIFixW/Ac/DchP5RjfnJhQXPe5O5ojDhSE2fc8BZOmvVNAClodNI
 byPurXTC2CdrtUexvYFbqSStmXSkXDcOxljH4Ntr3XGqikvDCUQSZAwxhhcENECEup
 c6hyN6bkW9j6WLtv1dFIr3Ep+eO5Hbk0jtKZvJqhVDlpJZUJCEHlZB0Iq448g0Sihc
 3qagOc8JRRsMrG+/IvmvZ91BkjGhi7CSY6H05Xeipw4ikAtF7PUm8brPLvu96IVOzm
 +R2GAF9Sycaf5MKiw0WCvPbNVv9lLpzW3IE2c1p3npvEleiZkNg0mCzEsqjK7J9C+8
 PJIOHDvZJnDFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WTiQtgXm
Subject: Re: [Buildroot] [PATCH 2/2] support/scripts/graph-depends allow for
 forward and reverse depends on same graph
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Steve, All,

On 2023-01-23 00:43 +0100, Steve Hay via buildroot spake thusly:
> Signed-off-by: Steve Hay <me@stevenhay.com>

Please write a commit log that explains the change (don't describe it.
explain it): as you could see from our discussion on IRC, the title of
your commit is not enough to understand what you are trying to achieve.

Maybe explain that it tries to represent both forward and backward
dependencies of a single package, with a little schema (here for pkg D):

    $ make pkg-d-graph-both-depends

    pkg A -.            .-> pkg E
            \          /
    pkg B ----> pkg D ----> pkg F
            /          \
    pkg C -'            '-> pkg G

Also, please insert this in the current package rules:

    $ make help
    [...]
    Package-specific:
      <pkg>                  - Build and install <pkg> and all its dependencies
      <pkg>-source           - Only download the source files for <pkg>
  [...]
      <pkg>-show-depends     - List packages on which <pkg> depends
      <pkg>-show-rdepends    - List packages which have <pkg> as a dependency
      <pkg>-show-recursive-depends
                             - Recursively list packages on which <pkg>
                               depends
      <pkg>-show-recursive-rdepends
                             - Recursively list packages which have <pkg> as
                               a dependency
      <pkg>-graph-depends    - Generate a graph of <pkg>'s dependencies
      <pkg>-graph-rdepends   - Generate a graph of <pkg>'s reverse dependencies
      <pkg>-graph-both-depends
                             - Generate a graph of both <pkg>'s forward and
                               reverse dependencies
      <pkg>-dirclean         - Remove <pkg> build directory
    [...]

> ---
>  support/scripts/graph-depends | 55 +++++++++++++++++++++++++----------
>  1 file changed, 39 insertions(+), 16 deletions(-)
> 
> diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
> index 3e3373950f..91aaf5d867 100755
> --- a/support/scripts/graph-depends
> +++ b/support/scripts/graph-depends
[--SNIP--]
> @@ -246,6 +251,8 @@ def parse_args():
>                          help="Graph the dependencies of PACKAGE")
>      parser.add_argument("--depth", '-d', metavar="DEPTH", dest="depth", type=int, default=0,
>                          help="Limit the dependency graph to DEPTH levels; 0 means no limit.")
> +    parser.add_argument("--rdepth", metavar="RDEPTH", dest="rdepth", type=int, default=0,
> +                        help="Limit the dependency graph to DEPTH levels; 0 means no limit.")

Do we really need to have two different options for the direct and
reverse depths?

If so, then be sure to modify the <pkg>-graph-rdepends accordingly (in
package/pkg-generic).

[--SNIP--]
> @@ -330,21 +337,37 @@ def main():
>          logging.error("Error: incorrect color list '%s'" % args.colors)
>          sys.exit(1)
>  
> -    deps, rdeps, dict_types, dict_versions = brpkgutil.get_dependency_tree()
> -    dict_deps = deps if args.direct else rdeps
> -
> -    check_circular_deps(dict_deps)
> -    if check_only:
> -        sys.exit(0)
> -
> -    dict_deps = remove_extra_deps(dict_deps, rootpkg, args.transitive, arrow_dir)
>  
>      # Start printing the graph data
>      if draw_graph:
>          outfile.write("digraph G {\n")
>  
> -    print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exclude_list,
> -                   arrow_dir, draw_graph, 0, args.depth, rootpkg, colors)
> +
> +    deps, rdeps, dict_types, dict_versions = brpkgutil.get_dependency_tree()
> +
> +    # forward
> +    if args.direct:
> +        dict_deps = deps
> +        direct = True
> +        #arrow_dir = "forward" # hack
> +        check_circular_deps(dict_deps)
> +        if check_only:
> +            sys.exit(0)

I am not very fond of this: if one were to call:

    $ graph-depends --direct --reverse --check-only

then one would expect to have both checks be run, but here only the
direct one will be.

I think we need to change check_circular_deps() to return False (no
circular dependencies) or True (circular dependencies) (or it can raise
an exception that we catch) and store that for later concumption.

    circ_deps = []

    if args.direct:
        if check_circular_deps(...):
            circ_deps.append('direct')
        if not args.checkonly:
            dict_deps = remove_extra_deps(...)
            print_pkg_deps(...)

    if args.reverse:
        if check_circular_deps(...):
            circ_deps.append('reverse')
        if not args.checkonly:
            dict_deps = remove_extra_deps(...)
            print_pkg_deps(...)

    if circ_deps:
        print(f"Bummer: circular {' and '.join(circ_deps)} dependencies detected")
        os.exit(1)

Something along those lines...

Regards,
Yann E. MORIN.

> +        dict_deps = remove_extra_deps(dict_deps, rootpkg, args.transitive, direct)
> +        print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exclude_list,
> +                       direct, draw_graph, 0, args.depth, rootpkg, colors)
> +
> +    # reverse
> +    if args.reverse:
> +        dict_deps = rdeps
> +        direct = False
> +        #arrow_dir = "back" # hack
> +        check_circular_deps(dict_deps)
> +        if check_only:
> +            sys.exit(0)
> +        dict_deps = remove_extra_deps(dict_deps, rootpkg, args.transitive, direct)
> +        print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exclude_list,
> +                       direct, draw_graph, 0, args.depth, rootpkg, colors)
>  
>      if draw_graph:
>          outfile.write("}\n")
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
