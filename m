From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 26 Apr 2018 08:02:01 +0200
Subject: [Buildroot] Rust runtime tests issues
In-Reply-To: <20180425232246.0f23f469@windsurf>
References: <20180417150658.5dd5b4cc@windsurf.numericable.fr>
 <779874370.225301500.1524046656503.JavaMail.root@zimbra32-e6.priv.proxad.net>
 <20180425232246.0f23f469@windsurf>
Message-ID: <20180426060201.GA16889@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-04-25 23:22, Thomas Petazzoni wrote:
> Hello Eric,
>
> On Wed, 18 Apr 2018 12:17:36 +0200 (CEST), Eric Le Bihan wrote:
>
> > The exception is raised because the execution of the command to
> > create a dummy test program "hello-world", with the previously built
> > version of host-cargo, fails.
> >
> > From the file TestRustBin-build.log found in the artifacts.zip of job
> > 63334942, we can see:
> >
> > ```
> > error: Failed to create project `hello-world` at `/tmp/tmpOEzb1U-br2-testing-rust/hello-world`
> >
> > Caused by:
> >   could not determine the current user, please set $USER
> > ```
> >
> > As the run-time test on CI apparently runs through Docker, should some setup
> > related to $USER be added to it?
>
> Why does it need to have a USER variable defined ? It seems weird to
> require details about the user running the build. The code seems to do
> this:
>
> fn discover_author() -> CargoResult<(String, Option<String>)> {
>     let cwd = env::current_dir()?;
>     let git_config = if let Ok(repo) = GitRepository::discover(&cwd) {
>         repo.config().ok().or_else(|| GitConfig::open_default().ok())
>     } else {
>         GitConfig::open_default().ok()
>     };
>     let git_config = git_config.as_ref();
>     let name_variables = ["CARGO_NAME", "GIT_AUTHOR_NAME", "GIT_COMMITTER_NAME",
>                          "USER", "USERNAME", "NAME"];
>     let name = get_environment_variable(&name_variables[0..3])
>                         .or_else(|| git_config.and_then(|g| g.get_string("user.name").ok()))
>                         .or_else(|| get_environment_variable(&name_variables[3..]));
>
>     let name = match name {
>         Some(name) => name,
>         None => {
>             let username_var = if cfg!(windows) {"USERNAME"} else {"USER"};
>             bail!("could not determine the current user, please set ${}",
>                   username_var)
>         }
>     };
>     let email_variables = ["CARGO_EMAIL", "GIT_AUTHOR_EMAIL", "GIT_COMMITTER_EMAIL",
>                           "EMAIL"];
>     let email = get_environment_variable(&email_variables[0..3])
>                           .or_else(|| git_config.and_then(|g| g.get_string("user.email").ok()))
>                           .or_else(|| get_environment_variable(&email_variables[3..]));
>
>     let name = name.trim().to_string();
>     let email = email.map(|s| s.trim().to_string());
>
>     Ok((name, email))
> }
>
> Should we set CARGO_NAME and CARGO_EMAIL ? Only when building cargo ?
> Everytime cargo is used ?

The error message comes from "src/cargo/ops/cargo_new.rs", so this means
it is raised when invoking 'cargo init' in the test script to create
the dummy test program.

There should be no need to set these environment variables everytime
cargo is used, only when creating a new project using 'cargo init/new',
which should most of the time be run by a human and not by Buildroot.

Adding 'env["USER"] = "br-user"' to TestRustBase.build_test_prog() should
do the trick.

I'll send a patch.

Thanks for the hint.

Regards,

--
ELB
