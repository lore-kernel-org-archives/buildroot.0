From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 3 Dec 2018 15:00:55 +0100
Subject: [Buildroot] [PATCH 15/15] ejabberd: Bump to version 18.09
In-Reply-To: <20181128224322.42641f73@windsurf.home>
References: <20181126110807.31431-1-johan.oudinet@gmail.com>
 <20181126110807.31431-16-johan.oudinet@gmail.com>
 <20181128224322.42641f73@windsurf.home>
Message-ID: <CAJtjsKZ+FF0cHtTWVQN6b74R08XuLXvPP6ta1ObNtTbo5ckcJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Christophe, All,

On Wed, Nov 28, 2018 at 10:43 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Comparing ejabberd/Config.in selects and ejabberd/ejabberd.mk
> DEPENDENCIES variable, I found that erlang-jiffy and erlang-p1-oauth2
> were selected by ejabberd/Config.in, but not mentioned in
> EJABBERD_DEPENDENCIES. In my build, they ended up being built after
> ejabberd, so they are clearly not build dependencies.
>
> The question is: are these runtime dependencies (in which case a #
> runtime comment in the Config.in file would be nice), or are they
> stale/useless dependencies ?

Hum, that's an interesting question. I followed mandatory dependencies
listed in Ejabberd's rebar.config but I'm not sure if those two
dependencies are runtime dependencies or if Ejabberd could run
smoothly without them.

I digged into Ejabberd's git repository to try to find out where
p1_oauth2 and jiffy are used, but I'd like Christophe's opinion on
this before taking any action.

For p1_oauth2, it's hard to say from the git log as the dependency was
there before the project moved to git. Still, there are calls to
oauth2 functions in src/ejabberd_oauth.erl file, in particular in the
oauth_issue_token function that can be called via the command line. So
I would assume it is a runtime dependency. Christophe, can you
confirm?

For jiffy, it is a JSON parser which is used in several parts of Ejabberd.
In mod_bosh, there is a function to deal with the case where it fails
to load this component:
start_jiffy(Opts) ->
    case gen_mod:get_opt(json, Opts) of
        false ->
            ok;
        true ->
            case catch ejabberd:start_app(jiffy) of
                ok ->
                    ok;
                Err ->
                    ?WARNING_MSG("Failed to start JSON codec (jiffy): ~p. "
                                 "JSON support will be disabled", [Err])
            end
    end.

but other components seem less tolerant. I think it is a runtime
dependency as well. Christophe, do you agree?

-- 
Johan
